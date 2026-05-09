; DESCRIPTION: Composite: Places a red dot at position (92, 227) then Renders a white line between points (173, 137) and (213, 211) then Places a magenta circle of radius 41 at center (368, 58).
; PLAN: r0=92(x), r1=227(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=173(x1), r6=137(y1), r7=213(x2), r8=211(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=368(x), r11=58(y), r12=41(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 92
LDI r1, 227
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 173
LDI r6, 137
LDI r7, 213
LDI r8, 211
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 58
LDI r12, 41
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
