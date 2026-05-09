; DESCRIPTION: Composite: Sets a single green pixel at (399, 88) then Draws a red rectangle at (127, 88) with width 22 and height 39 then Renders a magenta line between points (58, 223) and (281, 108).
; PLAN: r0=399(x), r1=88(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=88(y), r7=22(width), r8=39(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=58(x1), r11=223(y1), r12=281(x2), r13=108(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 88
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 127
LDI r6, 88
LDI r7, 22
LDI r8, 39
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 58
LDI r11, 223
LDI r12, 281
LDI r13, 108
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
