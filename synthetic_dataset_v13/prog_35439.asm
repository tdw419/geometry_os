; DESCRIPTION: Composite: Places a blue dot at position (496, 195) then Creates a white rectangular region at (467, 159) spanning 45 by 36 pixels then Renders a cyan line between points (64, 214) and (465, 208).
; PLAN: r0=496(x), r1=195(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=467(x), r6=159(y), r7=45(width), r8=36(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=64(x1), r11=214(y1), r12=465(x2), r13=208(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 496
LDI r1, 195
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 467
LDI r6, 159
LDI r7, 45
LDI r8, 36
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 214
LDI r12, 465
LDI r13, 208
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
