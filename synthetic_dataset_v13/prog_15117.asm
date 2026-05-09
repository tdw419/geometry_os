; DESCRIPTION: Composite: Sets a single purple pixel at (53, 89) then Renders a blue line between points (295, 13) and (235, 52) then Places a yellow 48x18 rectangle at position (330, 14).
; PLAN: r0=53(x), r1=89(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=295(x1), r6=13(y1), r7=235(x2), r8=52(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=330(x), r11=14(y), r12=48(width), r13=18(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 53
LDI r1, 89
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 295
LDI r6, 13
LDI r7, 235
LDI r8, 52
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 14
LDI r12, 48
LDI r13, 18
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
