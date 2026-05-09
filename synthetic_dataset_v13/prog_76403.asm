; DESCRIPTION: Renders a blue box of size 54x97 starting at (236, 38).
; PLAN: r0=236(x), r1=38(y), r2=54(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 38
LDI r2, 54
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
