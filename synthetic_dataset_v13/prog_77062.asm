; DESCRIPTION: Composite: Renders a magenta box of size 57x14 starting at (344, 147) then Places a red dot at position (7, 109).
; PLAN: r0=344(x), r1=147(y), r2=57(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=7(x), r6=109(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 344
LDI r1, 147
LDI r2, 57
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 109
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
