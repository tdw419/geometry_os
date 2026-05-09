; DESCRIPTION: Composite: Places a blue dot at position (417, 210) then Places a cyan 44x69 rectangle at position (15, 33) then Places a green line segment connecting (264, 189) to (110, 122).
; PLAN: r0=417(x), r1=210(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=15(x), r6=33(y), r7=44(width), r8=69(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=264(x1), r11=189(y1), r12=110(x2), r13=122(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 210
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 15
LDI r6, 33
LDI r7, 44
LDI r8, 69
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 189
LDI r12, 110
LDI r13, 122
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
