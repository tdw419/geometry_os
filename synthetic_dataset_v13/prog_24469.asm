; DESCRIPTION: Composite: Sets a single cyan pixel at (135, 225) then Renders a white line between points (167, 59) and (93, 43) then Places a black 93x43 rectangle at position (391, 123).
; PLAN: r0=135(x), r1=225(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=167(x1), r6=59(y1), r7=93(x2), r8=43(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=391(x), r11=123(y), r12=93(width), r13=43(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 135
LDI r1, 225
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 167
LDI r6, 59
LDI r7, 93
LDI r8, 43
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 123
LDI r12, 93
LDI r13, 43
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
