; DESCRIPTION: Composite: Draws a orange rectangle at (233, 51) with width 73 and height 33 then Renders a yellow line between points (79, 209) and (284, 102).
; PLAN: r0=233(x), r1=51(y), r2=73(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x1), r6=209(y1), r7=284(x2), r8=102(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 233
LDI r1, 51
LDI r2, 73
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 209
LDI r7, 284
LDI r8, 102
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
