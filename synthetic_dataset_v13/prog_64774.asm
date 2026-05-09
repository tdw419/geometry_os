; DESCRIPTION: Composite: Places a green circle of radius 52 at center (197, 167) then Places a cyan dot at position (117, 168) then Renders a red line between points (324, 199) and (348, 148).
; PLAN: r0=197(x), r1=167(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x), r6=168(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=324(x1), r11=199(y1), r12=348(x2), r13=148(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 167
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 168
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 324
LDI r11, 199
LDI r12, 348
LDI r13, 148
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
