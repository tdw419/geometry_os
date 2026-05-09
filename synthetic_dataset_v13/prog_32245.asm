; DESCRIPTION: Composite: Places a red line segment connecting (476, 166) to (446, 228) then Renders a black disk with center (186, 138) and radius 58.
; PLAN: r0=476(x1), r1=166(y1), r2=446(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=138(y), r7=58(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 476
LDI r1, 166
LDI r2, 446
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 138
LDI r7, 58
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
