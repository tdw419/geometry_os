; DESCRIPTION: Composite: Draws a orange rectangle at (260, 37) with width 37 and height 96 then Draws a magenta line from (410, 140) to (271, 152).
; PLAN: r0=260(x), r1=37(y), r2=37(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x1), r6=140(y1), r7=271(x2), r8=152(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 37
LDI r2, 37
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 140
LDI r7, 271
LDI r8, 152
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
