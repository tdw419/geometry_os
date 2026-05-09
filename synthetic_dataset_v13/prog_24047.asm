; DESCRIPTION: Composite: Creates a green circular shape at (410, 116) with radius 61 then Renders a black box of size 92x48 starting at (294, 63) then Renders a purple line between points (311, 174) and (353, 144).
; PLAN: r0=410(x), r1=116(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x), r6=63(y), r7=92(width), r8=48(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=311(x1), r11=174(y1), r12=353(x2), r13=144(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 116
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 63
LDI r7, 92
LDI r8, 48
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 174
LDI r12, 353
LDI r13, 144
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
