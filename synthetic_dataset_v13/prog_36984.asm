; DESCRIPTION: Composite: Draws a magenta line from (88, 123) to (188, 129) then Renders a yellow box of size 99x18 starting at (243, 132) then Places a black dot at position (5, 240).
; PLAN: r0=88(x1), r1=123(y1), r2=188(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=132(y), r7=99(width), r8=18(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=5(x), r11=240(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 88
LDI r1, 123
LDI r2, 188
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 132
LDI r7, 99
LDI r8, 18
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 240
LDI r12, 0x000000
PSET r10, r11, r12
HALT
