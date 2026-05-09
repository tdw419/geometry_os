; DESCRIPTION: Composite: Renders a red box of size 13x94 starting at (273, 149) then Places a blue line segment connecting (402, 57) to (225, 140).
; PLAN: r0=273(x), r1=149(y), r2=13(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x1), r6=57(y1), r7=225(x2), r8=140(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 149
LDI r2, 13
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 57
LDI r7, 225
LDI r8, 140
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
