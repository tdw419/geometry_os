; DESCRIPTION: Renders a purple box of size 35x98 starting at (320, 86).
; PLAN: r0=320(x), r1=86(y), r2=35(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 86
LDI r2, 35
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
