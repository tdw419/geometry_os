; DESCRIPTION: Renders a blue box of size 94x84 starting at (46, 86).
; PLAN: r0=46(x), r1=86(y), r2=94(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 86
LDI r2, 94
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
