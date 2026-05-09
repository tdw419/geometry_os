; DESCRIPTION: Composite: Creates a red rectangular region at (311, 150) spanning 93 by 27 pixels then Renders a yellow line between points (92, 167) and (106, 127) then Places a purple dot at position (228, 89).
; PLAN: r0=311(x), r1=150(y), r2=93(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x1), r6=167(y1), r7=106(x2), r8=127(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=228(x), r11=89(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 311
LDI r1, 150
LDI r2, 93
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 167
LDI r7, 106
LDI r8, 127
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 89
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
