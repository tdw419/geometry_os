; DESCRIPTION: Places a cyan 74x117 rectangle at position (357, 106).
; PLAN: r0=357(x), r1=106(y), r2=74(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 106
LDI r2, 74
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
