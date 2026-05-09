; DESCRIPTION: Composite: Draws a black rectangle at (123, 119) with width 52 and height 46 then Renders a cyan line between points (279, 19) and (364, 150).
; PLAN: r0=123(x), r1=119(y), r2=52(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x1), r6=19(y1), r7=364(x2), r8=150(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 119
LDI r2, 52
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 19
LDI r7, 364
LDI r8, 150
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
