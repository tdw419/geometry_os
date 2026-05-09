; DESCRIPTION: Places a cyan 19x18 rectangle at position (112, 106).
; PLAN: r0=112(x), r1=106(y), r2=19(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 106
LDI r2, 19
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
