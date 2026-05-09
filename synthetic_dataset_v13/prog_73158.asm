; DESCRIPTION: Composite: Draws a purple line from (227, 1) to (99, 55) then Creates a black rectangular region at (386, 39) spanning 51 by 96 pixels.
; PLAN: r0=227(x1), r1=1(y1), r2=99(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=39(y), r7=51(width), r8=96(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 1
LDI r2, 99
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 39
LDI r7, 51
LDI r8, 96
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
