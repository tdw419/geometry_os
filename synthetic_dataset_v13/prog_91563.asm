; DESCRIPTION: Composite: Renders a purple box of size 48x62 starting at (59, 74) then Sets a single yellow pixel at (436, 167).
; PLAN: r0=59(x), r1=74(y), r2=48(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=167(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 59
LDI r1, 74
LDI r2, 48
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 167
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
