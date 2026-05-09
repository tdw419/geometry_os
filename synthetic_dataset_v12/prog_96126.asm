; DESCRIPTION: Renders a blue box of size 112x16 starting at (94, 180).
; PLAN: r0=94(x), r1=180(y), r2=112(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 180
LDI r2, 112
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
