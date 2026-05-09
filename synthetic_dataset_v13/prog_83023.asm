; DESCRIPTION: Composite: Renders a black box of size 18x86 starting at (444, 51) then Draws a orange line from (341, 16) to (369, 223).
; PLAN: r0=444(x), r1=51(y), r2=18(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=341(x1), r6=16(y1), r7=369(x2), r8=223(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 51
LDI r2, 18
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 16
LDI r7, 369
LDI r8, 223
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
