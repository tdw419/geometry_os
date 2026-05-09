; DESCRIPTION: Composite: Draws a purple rectangle at (280, 72) with width 31 and height 111 then Places a cyan dot at position (339, 250) then Renders a magenta line between points (113, 116) and (419, 170).
; PLAN: r0=280(x), r1=72(y), r2=31(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x), r6=250(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=113(x1), r11=116(y1), r12=419(x2), r13=170(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 72
LDI r2, 31
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 250
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 113
LDI r11, 116
LDI r12, 419
LDI r13, 170
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
