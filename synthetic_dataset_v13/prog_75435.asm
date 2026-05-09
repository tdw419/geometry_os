; DESCRIPTION: Composite: Renders a green disk with center (337, 72) and radius 44 then Places a red 83x38 rectangle at position (215, 87) then Draws a black line from (203, 134) to (64, 5).
; PLAN: r0=337(x), r1=72(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x), r6=87(y), r7=83(width), r8=38(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=203(x1), r11=134(y1), r12=64(x2), r13=5(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 72
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 87
LDI r7, 83
LDI r8, 38
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 134
LDI r12, 64
LDI r13, 5
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
