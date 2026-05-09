; DESCRIPTION: Composite: Renders a cyan box of size 79x82 starting at (223, 96) then Draws a purple circle centered at (339, 126) with radius 80 then Draws a magenta line from (204, 8) to (464, 111).
; PLAN: r0=223(x), r1=96(y), r2=79(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x), r6=126(y), r7=80(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=204(x1), r11=8(y1), r12=464(x2), r13=111(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 96
LDI r2, 79
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 126
LDI r7, 80
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 204
LDI r11, 8
LDI r12, 464
LDI r13, 111
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
