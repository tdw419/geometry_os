; DESCRIPTION: Composite: Places a green dot at position (259, 82) then Renders a orange line between points (325, 144) and (82, 59) then Places a orange 76x99 rectangle at position (284, 1).
; PLAN: r0=259(x), r1=82(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=325(x1), r6=144(y1), r7=82(x2), r8=59(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=284(x), r11=1(y), r12=76(width), r13=99(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 82
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 325
LDI r6, 144
LDI r7, 82
LDI r8, 59
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 284
LDI r11, 1
LDI r12, 76
LDI r13, 99
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
