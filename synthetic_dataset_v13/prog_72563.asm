; DESCRIPTION: Composite: Places a white 59x104 rectangle at position (221, 68) then Renders a cyan line between points (216, 61) and (341, 110) then Places a orange dot at position (151, 140).
; PLAN: r0=221(x), r1=68(y), r2=59(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x1), r6=61(y1), r7=341(x2), r8=110(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=151(x), r11=140(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 221
LDI r1, 68
LDI r2, 59
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 61
LDI r7, 341
LDI r8, 110
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 151
LDI r11, 140
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
