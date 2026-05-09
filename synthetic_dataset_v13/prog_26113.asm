; DESCRIPTION: Renders a yellow box of size 60x65 starting at (319, 127).
; PLAN: r0=319(x), r1=127(y), r2=60(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 127
LDI r2, 60
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
