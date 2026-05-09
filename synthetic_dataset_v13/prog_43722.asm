; DESCRIPTION: Composite: Places a purple dot at position (281, 11) then Draws a white line from (72, 209) to (467, 109) then Creates a cyan rectangular region at (341, 195) spanning 77 by 16 pixels.
; PLAN: r0=281(x), r1=11(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=72(x1), r6=209(y1), r7=467(x2), r8=109(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=195(y), r12=77(width), r13=16(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 11
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 209
LDI r7, 467
LDI r8, 109
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 195
LDI r12, 77
LDI r13, 16
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
