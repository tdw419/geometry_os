; DESCRIPTION: Composite: Renders a black disk with center (269, 129) and radius 42 then Places a red line segment connecting (498, 29) to (92, 39) then Creates a black rectangular region at (358, 129) spanning 103 by 91 pixels.
; PLAN: r0=269(x), r1=129(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=498(x1), r6=29(y1), r7=92(x2), r8=39(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=358(x), r11=129(y), r12=103(width), r13=91(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 269
LDI r1, 129
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 498
LDI r6, 29
LDI r7, 92
LDI r8, 39
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 129
LDI r12, 103
LDI r13, 91
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
