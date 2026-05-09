; DESCRIPTION: Composite: Renders a black line between points (154, 33) and (209, 152) then Creates a blue rectangular region at (294, 136) spanning 35 by 57 pixels.
; PLAN: r0=154(x1), r1=33(y1), r2=209(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=136(y), r7=35(width), r8=57(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 33
LDI r2, 209
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 136
LDI r7, 35
LDI r8, 57
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
