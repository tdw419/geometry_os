; DESCRIPTION: Composite: Renders a red box of size 40x115 starting at (232, 111) then Draws a blue line from (303, 35) to (221, 194) then Places a orange dot at position (32, 116).
; PLAN: r0=232(x), r1=111(y), r2=40(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x1), r6=35(y1), r7=221(x2), r8=194(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=32(x), r11=116(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 111
LDI r2, 40
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 35
LDI r7, 221
LDI r8, 194
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 116
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
