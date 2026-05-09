; DESCRIPTION: Composite: Places a yellow dot at position (237, 43) then Renders a blue box of size 81x73 starting at (275, 183).
; PLAN: r0=237(x), r1=43(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=275(x), r6=183(y), r7=81(width), r8=73(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 237
LDI r1, 43
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 275
LDI r6, 183
LDI r7, 81
LDI r8, 73
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
