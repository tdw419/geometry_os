; DESCRIPTION: Composite: Sets a single white pixel at (140, 112) then Renders a black line between points (255, 140) and (264, 132) then Places a white 65x106 rectangle at position (13, 27).
; PLAN: r0=140(x), r1=112(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=255(x1), r6=140(y1), r7=264(x2), r8=132(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=13(x), r11=27(y), r12=65(width), r13=106(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 112
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 255
LDI r6, 140
LDI r7, 264
LDI r8, 132
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 27
LDI r12, 65
LDI r13, 106
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
