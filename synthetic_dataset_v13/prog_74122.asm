; DESCRIPTION: Renders a blue box of size 13x36 starting at (398, 85).
; PLAN: r0=398(x), r1=85(y), r2=13(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 85
LDI r2, 13
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
