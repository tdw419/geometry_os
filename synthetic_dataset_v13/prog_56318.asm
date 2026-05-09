; DESCRIPTION: Composite: Places a red circle of radius 80 at center (177, 157) then Renders a purple line between points (491, 45) and (265, 103) then Places a yellow 57x31 rectangle at position (239, 39).
; PLAN: r0=177(x), r1=157(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=491(x1), r6=45(y1), r7=265(x2), r8=103(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=239(x), r11=39(y), r12=57(width), r13=31(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 157
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 491
LDI r6, 45
LDI r7, 265
LDI r8, 103
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 39
LDI r12, 57
LDI r13, 31
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
