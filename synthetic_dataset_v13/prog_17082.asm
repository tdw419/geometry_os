; DESCRIPTION: Composite: Sets a single cyan pixel at (337, 204) then Renders a magenta line between points (271, 217) and (7, 65) then Draws a green rectangle at (80, 144) with width 23 and height 111.
; PLAN: r0=337(x), r1=204(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=271(x1), r6=217(y1), r7=7(x2), r8=65(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=80(x), r11=144(y), r12=23(width), r13=111(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 204
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 271
LDI r6, 217
LDI r7, 7
LDI r8, 65
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 144
LDI r12, 23
LDI r13, 111
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
