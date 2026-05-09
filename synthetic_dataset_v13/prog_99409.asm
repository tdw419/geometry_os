; DESCRIPTION: Composite: Places a blue dot at position (22, 248) then Renders a orange line between points (215, 50) and (424, 62) then Places a green 72x56 rectangle at position (393, 131).
; PLAN: r0=22(x), r1=248(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=215(x1), r6=50(y1), r7=424(x2), r8=62(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=393(x), r11=131(y), r12=72(width), r13=56(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 22
LDI r1, 248
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 215
LDI r6, 50
LDI r7, 424
LDI r8, 62
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 131
LDI r12, 72
LDI r13, 56
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
