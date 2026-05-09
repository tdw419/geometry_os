; DESCRIPTION: Composite: Renders a yellow disk with center (263, 146) and radius 65 then Renders a orange box of size 33x28 starting at (455, 73) then Draws a blue line from (434, 128) to (169, 162).
; PLAN: r0=263(x), r1=146(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x), r6=73(y), r7=33(width), r8=28(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=434(x1), r11=128(y1), r12=169(x2), r13=162(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 146
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 73
LDI r7, 33
LDI r8, 28
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 128
LDI r12, 169
LDI r13, 162
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
