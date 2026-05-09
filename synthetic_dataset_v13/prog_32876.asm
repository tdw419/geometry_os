; DESCRIPTION: Composite: Sets a single white pixel at (126, 106) then Places a red 91x91 rectangle at position (356, 29) then Renders a green line between points (290, 10) and (447, 226).
; PLAN: r0=126(x), r1=106(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=356(x), r6=29(y), r7=91(width), r8=91(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=290(x1), r11=10(y1), r12=447(x2), r13=226(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 106
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 356
LDI r6, 29
LDI r7, 91
LDI r8, 91
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 10
LDI r12, 447
LDI r13, 226
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
