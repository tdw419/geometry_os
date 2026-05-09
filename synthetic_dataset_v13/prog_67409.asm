; DESCRIPTION: Composite: Draws a cyan rectangle at (164, 157) with width 79 and height 77 then Renders a cyan disk with center (251, 237) and radius 18 then Renders a red line between points (418, 223) and (320, 16).
; PLAN: r0=164(x), r1=157(y), r2=79(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x), r6=237(y), r7=18(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=418(x1), r11=223(y1), r12=320(x2), r13=16(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 157
LDI r2, 79
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 237
LDI r7, 18
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 418
LDI r11, 223
LDI r12, 320
LDI r13, 16
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
