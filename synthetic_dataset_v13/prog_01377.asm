; DESCRIPTION: Composite: Places a cyan dot at position (369, 177) then Draws a blue rectangle at (202, 57) with width 50 and height 31 then Places a magenta line segment connecting (100, 58) to (360, 243).
; PLAN: r0=369(x), r1=177(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=57(y), r7=50(width), r8=31(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=100(x1), r11=58(y1), r12=360(x2), r13=243(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 177
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 57
LDI r7, 50
LDI r8, 31
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 58
LDI r12, 360
LDI r13, 243
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
