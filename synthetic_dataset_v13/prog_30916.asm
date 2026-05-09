; DESCRIPTION: Composite: Sets a single green pixel at (100, 76) then Renders a cyan line between points (439, 105) and (135, 59) then Places a black 96x15 rectangle at position (389, 160).
; PLAN: r0=100(x), r1=76(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=439(x1), r6=105(y1), r7=135(x2), r8=59(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=389(x), r11=160(y), r12=96(width), r13=15(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 76
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 439
LDI r6, 105
LDI r7, 135
LDI r8, 59
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 389
LDI r11, 160
LDI r12, 96
LDI r13, 15
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
