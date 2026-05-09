; DESCRIPTION: Composite: Renders a red disk with center (482, 186) and radius 19 then Renders a yellow box of size 95x102 starting at (267, 5) then Places a white line segment connecting (413, 151) to (63, 11).
; PLAN: r0=482(x), r1=186(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x), r6=5(y), r7=95(width), r8=102(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=413(x1), r11=151(y1), r12=63(x2), r13=11(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 482
LDI r1, 186
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 5
LDI r7, 95
LDI r8, 102
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 413
LDI r11, 151
LDI r12, 63
LDI r13, 11
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
