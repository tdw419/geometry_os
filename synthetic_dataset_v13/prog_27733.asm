; DESCRIPTION: Composite: Renders a magenta box of size 88x48 starting at (59, 147) then Sets a single green pixel at (144, 226).
; PLAN: r0=59(x), r1=147(y), r2=88(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x), r6=226(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 59
LDI r1, 147
LDI r2, 88
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 226
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
