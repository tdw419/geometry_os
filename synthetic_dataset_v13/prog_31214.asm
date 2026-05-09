; DESCRIPTION: Composite: Sets a single cyan pixel at (427, 111) then Places a black 95x47 rectangle at position (257, 42) then Renders a cyan line between points (132, 23) and (88, 8).
; PLAN: r0=427(x), r1=111(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=257(x), r6=42(y), r7=95(width), r8=47(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=132(x1), r11=23(y1), r12=88(x2), r13=8(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 427
LDI r1, 111
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 257
LDI r6, 42
LDI r7, 95
LDI r8, 47
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 23
LDI r12, 88
LDI r13, 8
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
