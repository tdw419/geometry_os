; DESCRIPTION: Composite: Sets a single green pixel at (148, 190) then Renders a magenta box of size 119x95 starting at (90, 144).
; PLAN: r0=148(x), r1=190(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=144(y), r7=119(width), r8=95(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 190
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 90
LDI r6, 144
LDI r7, 119
LDI r8, 95
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
