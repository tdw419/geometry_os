; DESCRIPTION: Composite: Draws a white line from (123, 196) to (188, 127) then Creates a blue rectangular region at (415, 13) spanning 77 by 117 pixels.
; PLAN: r0=123(x1), r1=196(y1), r2=188(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=13(y), r7=77(width), r8=117(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 196
LDI r2, 188
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 13
LDI r7, 77
LDI r8, 117
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
