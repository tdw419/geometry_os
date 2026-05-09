; DESCRIPTION: Composite: Places a cyan line segment connecting (283, 206) to (139, 126) then Places a white dot at position (330, 179) then Renders a cyan box of size 90x19 starting at (316, 93).
; PLAN: r0=283(x1), r1=206(y1), r2=139(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=179(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=316(x), r11=93(y), r12=90(width), r13=19(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 206
LDI r2, 139
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 179
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 316
LDI r11, 93
LDI r12, 90
LDI r13, 19
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
