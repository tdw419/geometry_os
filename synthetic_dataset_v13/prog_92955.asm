; DESCRIPTION: Renders a green box of size 84x91 starting at (385, 94).
; PLAN: r0=385(x), r1=94(y), r2=84(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 94
LDI r2, 84
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
