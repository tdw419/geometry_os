; DESCRIPTION: Composite: Renders a yellow line between points (4, 164) and (34, 130) then Creates a blue rectangular region at (196, 165) spanning 77 by 50 pixels.
; PLAN: r0=4(x1), r1=164(y1), r2=34(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=165(y), r7=77(width), r8=50(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 164
LDI r2, 34
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 165
LDI r7, 77
LDI r8, 50
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
