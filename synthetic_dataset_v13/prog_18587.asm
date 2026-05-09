; DESCRIPTION: Composite: Renders a red box of size 35x63 starting at (12, 116) then Renders a blue line between points (298, 201) and (59, 99) then Places a black dot at position (45, 91).
; PLAN: r0=12(x), r1=116(y), r2=35(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x1), r6=201(y1), r7=59(x2), r8=99(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=45(x), r11=91(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 12
LDI r1, 116
LDI r2, 35
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 201
LDI r7, 59
LDI r8, 99
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 91
LDI r12, 0x000000
PSET r10, r11, r12
HALT
