; DESCRIPTION: Composite: Draws a white line from (315, 220) to (48, 197) then Renders a orange box of size 86x20 starting at (79, 116) then Creates a white circular shape at (159, 71) with radius 64.
; PLAN: r0=315(x1), r1=220(y1), r2=48(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=79(x), r6=116(y), r7=86(width), r8=20(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=159(x), r11=71(y), r12=64(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 315
LDI r1, 220
LDI r2, 48
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 116
LDI r7, 86
LDI r8, 20
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 71
LDI r12, 64
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
