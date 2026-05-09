; DESCRIPTION: Renders a purple box of size 111x48 starting at (347, 93).
; PLAN: r0=347(x), r1=93(y), r2=111(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 93
LDI r2, 111
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
