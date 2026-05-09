; DESCRIPTION: Composite: Creates a yellow rectangular region at (289, 0) spanning 120 by 52 pixels then Sets a single red pixel at (502, 87) then Renders a yellow line between points (460, 221) and (41, 222).
; PLAN: r0=289(x), r1=0(y), r2=120(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=502(x), r6=87(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=460(x1), r11=221(y1), r12=41(x2), r13=222(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 0
LDI r2, 120
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 87
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 460
LDI r11, 221
LDI r12, 41
LDI r13, 222
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
