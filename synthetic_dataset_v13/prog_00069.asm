; DESCRIPTION: Composite: Draws a cyan line from (481, 171) to (217, 230) then Draws a orange circle centered at (88, 96) with radius 34 then Creates a purple rectangular region at (404, 151) spanning 69 by 50 pixels.
; PLAN: r0=481(x1), r1=171(y1), r2=217(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=96(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=404(x), r11=151(y), r12=69(width), r13=50(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 481
LDI r1, 171
LDI r2, 217
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 96
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 404
LDI r11, 151
LDI r12, 69
LDI r13, 50
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
