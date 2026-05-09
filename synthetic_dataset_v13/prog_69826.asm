; DESCRIPTION: Composite: Renders a white box of size 103x17 starting at (148, 52) then Places a orange dot at position (404, 228) then Draws a purple line from (55, 251) to (31, 113).
; PLAN: r0=148(x), r1=52(y), r2=103(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x), r6=228(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=55(x1), r11=251(y1), r12=31(x2), r13=113(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 52
LDI r2, 103
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 228
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 55
LDI r11, 251
LDI r12, 31
LDI r13, 113
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
