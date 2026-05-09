; DESCRIPTION: Composite: Sets a single magenta pixel at (306, 148) then Draws a red line from (196, 20) to (269, 253) then Draws a orange rectangle at (305, 75) with width 28 and height 59.
; PLAN: r0=306(x), r1=148(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=196(x1), r6=20(y1), r7=269(x2), r8=253(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=305(x), r11=75(y), r12=28(width), r13=59(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 148
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 196
LDI r6, 20
LDI r7, 269
LDI r8, 253
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 75
LDI r12, 28
LDI r13, 59
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
