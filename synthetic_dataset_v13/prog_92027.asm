; DESCRIPTION: Composite: Places a blue dot at position (331, 194) then Renders a black box of size 28x65 starting at (274, 167).
; PLAN: r0=331(x), r1=194(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=167(y), r7=28(width), r8=65(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 331
LDI r1, 194
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 274
LDI r6, 167
LDI r7, 28
LDI r8, 65
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
