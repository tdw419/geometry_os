; DESCRIPTION: Composite: Sets a single green pixel at (201, 59) then Renders a yellow box of size 42x17 starting at (125, 194) then Places a white line segment connecting (186, 13) to (443, 99).
; PLAN: r0=201(x), r1=59(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=194(y), r7=42(width), r8=17(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=186(x1), r11=13(y1), r12=443(x2), r13=99(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 201
LDI r1, 59
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 125
LDI r6, 194
LDI r7, 42
LDI r8, 17
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 186
LDI r11, 13
LDI r12, 443
LDI r13, 99
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
