; DESCRIPTION: Composite: Renders a blue disk with center (259, 172) and radius 42 then Draws a red rectangle at (379, 125) with width 80 and height 61 then Renders a white line between points (360, 215) and (180, 83).
; PLAN: r0=259(x), r1=172(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=125(y), r7=80(width), r8=61(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=360(x1), r11=215(y1), r12=180(x2), r13=83(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 172
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 125
LDI r7, 80
LDI r8, 61
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 215
LDI r12, 180
LDI r13, 83
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
