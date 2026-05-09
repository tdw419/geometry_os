; DESCRIPTION: Composite: Places a cyan dot at position (69, 193) then Draws a blue line from (122, 39) to (266, 29) then Places a black 26x116 rectangle at position (395, 35).
; PLAN: r0=69(x), r1=193(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=122(x1), r6=39(y1), r7=266(x2), r8=29(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=395(x), r11=35(y), r12=26(width), r13=116(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 193
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 122
LDI r6, 39
LDI r7, 266
LDI r8, 29
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 35
LDI r12, 26
LDI r13, 116
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
