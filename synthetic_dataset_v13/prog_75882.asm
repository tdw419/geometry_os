; DESCRIPTION: Composite: Places a black dot at position (465, 222) then Renders a magenta box of size 111x80 starting at (194, 110).
; PLAN: r0=465(x), r1=222(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=110(y), r7=111(width), r8=80(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 465
LDI r1, 222
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 194
LDI r6, 110
LDI r7, 111
LDI r8, 80
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
