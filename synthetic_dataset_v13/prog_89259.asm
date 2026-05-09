; DESCRIPTION: Composite: Places a red line segment connecting (252, 15) to (73, 220) then Renders a black disk with center (271, 183) and radius 60 then Places a black 52x61 rectangle at position (127, 126).
; PLAN: r0=252(x1), r1=15(y1), r2=73(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=183(y), r7=60(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=127(x), r11=126(y), r12=52(width), r13=61(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 15
LDI r2, 73
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 183
LDI r7, 60
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 127
LDI r11, 126
LDI r12, 52
LDI r13, 61
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
