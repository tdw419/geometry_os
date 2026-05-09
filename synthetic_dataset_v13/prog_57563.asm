; DESCRIPTION: Composite: Renders a magenta line between points (332, 139) and (3, 111) then Sets a single cyan pixel at (464, 6) then Creates a white rectangular region at (73, 2) spanning 54 by 14 pixels.
; PLAN: r0=332(x1), r1=139(y1), r2=3(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=6(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=73(x), r11=2(y), r12=54(width), r13=14(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 332
LDI r1, 139
LDI r2, 3
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 6
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 73
LDI r11, 2
LDI r12, 54
LDI r13, 14
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
