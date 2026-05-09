; DESCRIPTION: Renders a purple box of size 23x13 starting at (296, 152).
; PLAN: r0=296(x), r1=152(y), r2=23(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 152
LDI r2, 23
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
