; DESCRIPTION: Renders a purple box of size 50x87 starting at (385, 144).
; PLAN: r0=385(x), r1=144(y), r2=50(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 144
LDI r2, 50
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
