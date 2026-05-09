; DESCRIPTION: Composite: Places a purple 45x39 rectangle at position (83, 47) then Renders a magenta disk with center (256, 82) and radius 45 then Renders a magenta line between points (97, 241) and (28, 48).
; PLAN: r0=83(x), r1=47(y), r2=45(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x), r6=82(y), r7=45(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=97(x1), r11=241(y1), r12=28(x2), r13=48(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 47
LDI r2, 45
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 82
LDI r7, 45
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 97
LDI r11, 241
LDI r12, 28
LDI r13, 48
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
