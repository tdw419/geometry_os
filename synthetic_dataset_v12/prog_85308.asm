; DESCRIPTION: Renders a purple box of size 103x21 starting at (250, 163).
; PLAN: r0=250(x), r1=163(y), r2=103(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 163
LDI r2, 103
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
