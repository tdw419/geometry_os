; DESCRIPTION: Places a cyan 102x117 rectangle at position (138, 112).
; PLAN: r0=138(x), r1=112(y), r2=102(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 112
LDI r2, 102
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
