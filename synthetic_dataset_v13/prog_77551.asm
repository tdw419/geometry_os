; DESCRIPTION: Composite: Places a yellow dot at position (111, 155) then Places a magenta 118x77 rectangle at position (158, 154).
; PLAN: r0=111(x), r1=155(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=158(x), r6=154(y), r7=118(width), r8=77(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 155
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 158
LDI r6, 154
LDI r7, 118
LDI r8, 77
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
