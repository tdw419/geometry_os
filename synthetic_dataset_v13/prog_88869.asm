; DESCRIPTION: Composite: Renders a white line between points (242, 178) and (19, 166) then Draws a yellow rectangle at (144, 114) with width 65 and height 112 then Places a cyan circle of radius 66 at center (345, 81).
; PLAN: r0=242(x1), r1=178(y1), r2=19(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=114(y), r7=65(width), r8=112(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=345(x), r11=81(y), r12=66(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 242
LDI r1, 178
LDI r2, 19
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 114
LDI r7, 65
LDI r8, 112
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 345
LDI r11, 81
LDI r12, 66
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
