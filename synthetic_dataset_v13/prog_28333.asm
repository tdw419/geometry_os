; DESCRIPTION: Places a cyan 79x117 rectangle at position (388, 138).
; PLAN: r0=388(x), r1=138(y), r2=79(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 138
LDI r2, 79
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
