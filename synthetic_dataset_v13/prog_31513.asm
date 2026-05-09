; DESCRIPTION: Composite: Places a white line segment connecting (240, 221) to (136, 227) then Places a green 50x39 rectangle at position (124, 82) then Renders a black disk with center (379, 145) and radius 42.
; PLAN: r0=240(x1), r1=221(y1), r2=136(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=124(x), r6=82(y), r7=50(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=379(x), r11=145(y), r12=42(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 240
LDI r1, 221
LDI r2, 136
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 82
LDI r7, 50
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 145
LDI r12, 42
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
