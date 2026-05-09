; DESCRIPTION: Composite: Sets a single blue pixel at (362, 198) then Places a magenta line segment connecting (435, 33) to (403, 80) then Draws a yellow rectangle at (242, 1) with width 11 and height 50.
; PLAN: r0=362(x), r1=198(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=435(x1), r6=33(y1), r7=403(x2), r8=80(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=242(x), r11=1(y), r12=11(width), r13=50(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 198
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 435
LDI r6, 33
LDI r7, 403
LDI r8, 80
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 1
LDI r12, 11
LDI r13, 50
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
