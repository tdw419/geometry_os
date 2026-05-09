; DESCRIPTION: Composite: Renders a green line between points (145, 56) and (441, 233) then Draws a magenta circle centered at (394, 44) with radius 20 then Places a black 83x10 rectangle at position (231, 138).
; PLAN: r0=145(x1), r1=56(y1), r2=441(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=44(y), r7=20(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=231(x), r11=138(y), r12=83(width), r13=10(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 56
LDI r2, 441
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 44
LDI r7, 20
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 231
LDI r11, 138
LDI r12, 83
LDI r13, 10
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
