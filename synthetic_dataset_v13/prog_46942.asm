; DESCRIPTION: Composite: Renders a purple box of size 86x77 starting at (165, 103) then Places a green line segment connecting (486, 135) to (75, 105) then Places a yellow dot at position (129, 40).
; PLAN: r0=165(x), r1=103(y), r2=86(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=486(x1), r6=135(y1), r7=75(x2), r8=105(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=129(x), r11=40(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 165
LDI r1, 103
LDI r2, 86
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 135
LDI r7, 75
LDI r8, 105
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 40
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
