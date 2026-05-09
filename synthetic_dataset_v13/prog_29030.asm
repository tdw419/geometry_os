; DESCRIPTION: Composite: Draws a magenta line from (189, 239) to (398, 243) then Places a red circle of radius 47 at center (464, 205) then Draws a cyan rectangle at (378, 88) with width 37 and height 105.
; PLAN: r0=189(x1), r1=239(y1), r2=398(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=205(y), r7=47(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=378(x), r11=88(y), r12=37(width), r13=105(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 239
LDI r2, 398
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 205
LDI r7, 47
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 378
LDI r11, 88
LDI r12, 37
LDI r13, 105
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
