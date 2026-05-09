; DESCRIPTION: Renders a blue box of size 48x97 starting at (38, 150).
; PLAN: r0=38(x), r1=150(y), r2=48(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 150
LDI r2, 48
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
