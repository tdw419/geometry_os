; DESCRIPTION: Composite: Renders a magenta disk with center (465, 91) and radius 44 then Draws a blue line from (483, 181) to (202, 25) then Renders a orange box of size 33x76 starting at (228, 18).
; PLAN: r0=465(x), r1=91(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x1), r6=181(y1), r7=202(x2), r8=25(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=228(x), r11=18(y), r12=33(width), r13=76(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 465
LDI r1, 91
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 181
LDI r7, 202
LDI r8, 25
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 18
LDI r12, 33
LDI r13, 76
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
