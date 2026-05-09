; DESCRIPTION: Composite: Creates a magenta rectangular region at (275, 96) spanning 45 by 86 pixels then Renders a cyan disk with center (197, 164) and radius 47 then Places a yellow line segment connecting (151, 174) to (439, 211).
; PLAN: r0=275(x), r1=96(y), r2=45(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x), r6=164(y), r7=47(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=151(x1), r11=174(y1), r12=439(x2), r13=211(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 96
LDI r2, 45
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 164
LDI r7, 47
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 151
LDI r11, 174
LDI r12, 439
LDI r13, 211
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
