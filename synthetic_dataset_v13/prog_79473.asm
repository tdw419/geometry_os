; DESCRIPTION: Composite: Draws a purple line from (422, 129) to (416, 5) then Creates a cyan circular shape at (143, 220) with radius 32 then Creates a red rectangular region at (347, 218) spanning 60 by 11 pixels.
; PLAN: r0=422(x1), r1=129(y1), r2=416(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=220(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=347(x), r11=218(y), r12=60(width), r13=11(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 422
LDI r1, 129
LDI r2, 416
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 220
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 347
LDI r11, 218
LDI r12, 60
LDI r13, 11
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
