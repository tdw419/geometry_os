; DESCRIPTION: Renders a purple box of size 96x40 starting at (65, 111).
; PLAN: r0=65(x), r1=111(y), r2=96(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 111
LDI r2, 96
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
