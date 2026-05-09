; DESCRIPTION: Composite: Draws a red line from (43, 35) to (336, 222) then Places a white dot at position (416, 7) then Places a purple 65x116 rectangle at position (322, 111).
; PLAN: r0=43(x1), r1=35(y1), r2=336(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=7(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=322(x), r11=111(y), r12=65(width), r13=116(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 43
LDI r1, 35
LDI r2, 336
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 7
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 322
LDI r11, 111
LDI r12, 65
LDI r13, 116
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
