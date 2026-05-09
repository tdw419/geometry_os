; DESCRIPTION: Composite: Sets a single red pixel at (289, 64) then Places a green 12x90 rectangle at position (47, 134) then Renders a cyan line between points (99, 183) and (102, 26).
; PLAN: r0=289(x), r1=64(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=47(x), r6=134(y), r7=12(width), r8=90(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=99(x1), r11=183(y1), r12=102(x2), r13=26(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 64
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 47
LDI r6, 134
LDI r7, 12
LDI r8, 90
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 183
LDI r12, 102
LDI r13, 26
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
