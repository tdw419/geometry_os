; DESCRIPTION: Renders a blue box of size 117x64 starting at (162, 54).
; PLAN: r0=162(x), r1=54(y), r2=117(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 54
LDI r2, 117
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
