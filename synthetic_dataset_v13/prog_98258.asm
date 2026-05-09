; DESCRIPTION: Composite: Places a purple dot at position (491, 224) then Renders a green box of size 90x90 starting at (259, 129).
; PLAN: r0=491(x), r1=224(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=129(y), r7=90(width), r8=90(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 491
LDI r1, 224
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 259
LDI r6, 129
LDI r7, 90
LDI r8, 90
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
