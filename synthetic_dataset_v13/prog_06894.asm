; DESCRIPTION: Composite: Places a green circle of radius 75 at center (364, 107) then Renders a cyan box of size 23x117 starting at (90, 112).
; PLAN: r0=364(x), r1=107(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x), r6=112(y), r7=23(width), r8=117(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 107
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 112
LDI r7, 23
LDI r8, 117
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
