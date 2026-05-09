; DESCRIPTION: Composite: Places a cyan 60x12 rectangle at position (109, 47) then Draws a magenta line from (421, 130) to (166, 183) then Places a purple dot at position (316, 182).
; PLAN: r0=109(x), r1=47(y), r2=60(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x1), r6=130(y1), r7=166(x2), r8=183(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=316(x), r11=182(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 109
LDI r1, 47
LDI r2, 60
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 130
LDI r7, 166
LDI r8, 183
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 182
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
