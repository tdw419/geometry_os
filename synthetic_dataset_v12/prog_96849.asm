; DESCRIPTION: Composite: Renders a black box of size 18x56 starting at (385, 54) then Draws a green circle centered at (388, 44) with radius 34 then Draws a cyan line from (343, 248) to (345, 34).
; PLAN: r0=385(x), r1=54(y), r2=18(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=44(y), r7=34(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=343(x1), r11=248(y1), r12=345(x2), r13=34(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 54
LDI r2, 18
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 44
LDI r7, 34
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 343
LDI r11, 248
LDI r12, 345
LDI r13, 34
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
