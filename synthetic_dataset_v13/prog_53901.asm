; DESCRIPTION: Composite: Sets a single blue pixel at (242, 44) then Renders a magenta box of size 62x80 starting at (274, 27).
; PLAN: r0=242(x), r1=44(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=27(y), r7=62(width), r8=80(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 44
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 274
LDI r6, 27
LDI r7, 62
LDI r8, 80
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
