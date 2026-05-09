; DESCRIPTION: Composite: Renders a white line between points (142, 39) and (276, 31) then Sets a single cyan pixel at (337, 155) then Creates a black rectangular region at (143, 75) spanning 60 by 70 pixels.
; PLAN: r0=142(x1), r1=39(y1), r2=276(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=155(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=143(x), r11=75(y), r12=60(width), r13=70(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 39
LDI r2, 276
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 155
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 143
LDI r11, 75
LDI r12, 60
LDI r13, 70
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
