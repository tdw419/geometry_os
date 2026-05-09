; DESCRIPTION: Composite: Draws a magenta circle centered at (328, 39) with radius 20 then Draws a yellow line from (238, 58) to (330, 189) then Creates a cyan rectangular region at (161, 176) spanning 51 by 75 pixels.
; PLAN: r0=328(x), r1=39(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=238(x1), r6=58(y1), r7=330(x2), r8=189(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=176(y), r12=51(width), r13=75(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 39
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 238
LDI r6, 58
LDI r7, 330
LDI r8, 189
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 176
LDI r12, 51
LDI r13, 75
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
