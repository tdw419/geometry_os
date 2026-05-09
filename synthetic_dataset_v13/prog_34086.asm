; DESCRIPTION: Composite: Renders a magenta line between points (24, 106) and (221, 228) then Places a red dot at position (303, 128) then Creates a red circular shape at (337, 183) with radius 54.
; PLAN: r0=24(x1), r1=106(y1), r2=221(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=128(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=337(x), r11=183(y), r12=54(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 24
LDI r1, 106
LDI r2, 221
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 128
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 337
LDI r11, 183
LDI r12, 54
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
