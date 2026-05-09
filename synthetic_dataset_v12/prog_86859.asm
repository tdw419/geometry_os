; DESCRIPTION: Composite: Places a black line segment connecting (19, 209) to (273, 210) then Creates a blue rectangular region at (267, 66) spanning 37 by 103 pixels.
; PLAN: r0=19(x1), r1=209(y1), r2=273(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=66(y), r7=37(width), r8=103(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 19
LDI r1, 209
LDI r2, 273
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 66
LDI r7, 37
LDI r8, 103
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
