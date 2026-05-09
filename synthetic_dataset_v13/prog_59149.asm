; DESCRIPTION: Composite: Places a purple dot at position (192, 6) then Renders a green box of size 32x60 starting at (453, 181).
; PLAN: r0=192(x), r1=6(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=453(x), r6=181(y), r7=32(width), r8=60(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 6
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 453
LDI r6, 181
LDI r7, 32
LDI r8, 60
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
