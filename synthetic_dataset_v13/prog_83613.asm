; DESCRIPTION: Composite: Renders a cyan box of size 54x51 starting at (228, 144) then Draws a green line from (352, 139) to (92, 178) then Draws a green circle centered at (493, 83) with radius 10.
; PLAN: r0=228(x), r1=144(y), r2=54(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x1), r6=139(y1), r7=92(x2), r8=178(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=493(x), r11=83(y), r12=10(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 228
LDI r1, 144
LDI r2, 54
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 139
LDI r7, 92
LDI r8, 178
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 493
LDI r11, 83
LDI r12, 10
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
