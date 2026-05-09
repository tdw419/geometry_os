; DESCRIPTION: Composite: Places a magenta dot at position (308, 56) then Draws a purple rectangle at (19, 87) with width 99 and height 54 then Renders a magenta line between points (245, 215) and (63, 18).
; PLAN: r0=308(x), r1=56(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=19(x), r6=87(y), r7=99(width), r8=54(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=245(x1), r11=215(y1), r12=63(x2), r13=18(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 56
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 19
LDI r6, 87
LDI r7, 99
LDI r8, 54
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 215
LDI r12, 63
LDI r13, 18
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
