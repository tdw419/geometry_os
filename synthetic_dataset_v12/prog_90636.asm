; DESCRIPTION: Renders a blue box of size 57x22 starting at (432, 16).
; PLAN: r0=432(x), r1=16(y), r2=57(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 16
LDI r2, 57
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
