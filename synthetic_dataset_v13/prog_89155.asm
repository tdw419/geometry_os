; DESCRIPTION: Composite: Places a green dot at position (10, 27) then Draws a purple line from (285, 164) to (397, 164) then Places a white 11x11 rectangle at position (315, 154).
; PLAN: r0=10(x), r1=27(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=285(x1), r6=164(y1), r7=397(x2), r8=164(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=315(x), r11=154(y), r12=11(width), r13=11(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 10
LDI r1, 27
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 285
LDI r6, 164
LDI r7, 397
LDI r8, 164
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 154
LDI r12, 11
LDI r13, 11
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
