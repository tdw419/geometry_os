; DESCRIPTION: Composite: Sets a single red pixel at (317, 223) then Renders a green box of size 93x19 starting at (267, 152) then Renders a purple line between points (173, 14) and (494, 207).
; PLAN: r0=317(x), r1=223(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=267(x), r6=152(y), r7=93(width), r8=19(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=173(x1), r11=14(y1), r12=494(x2), r13=207(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 223
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 267
LDI r6, 152
LDI r7, 93
LDI r8, 19
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 14
LDI r12, 494
LDI r13, 207
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
