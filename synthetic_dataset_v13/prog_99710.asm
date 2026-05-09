; DESCRIPTION: Places a cyan 79x19 rectangle at position (156, 0).
; PLAN: r0=156(x), r1=0(y), r2=79(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 0
LDI r2, 79
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
