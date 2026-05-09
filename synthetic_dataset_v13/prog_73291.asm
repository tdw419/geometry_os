; DESCRIPTION: Composite: Sets a single cyan pixel at (303, 168) then Places a white 105x13 rectangle at position (266, 163) then Renders a black line between points (248, 229) and (372, 49).
; PLAN: r0=303(x), r1=168(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=266(x), r6=163(y), r7=105(width), r8=13(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=248(x1), r11=229(y1), r12=372(x2), r13=49(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 168
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 266
LDI r6, 163
LDI r7, 105
LDI r8, 13
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 229
LDI r12, 372
LDI r13, 49
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
