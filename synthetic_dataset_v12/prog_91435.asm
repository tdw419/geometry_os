; DESCRIPTION: Composite: Renders a orange box of size 20x87 starting at (322, 4) then Renders a magenta disk with center (195, 151) and radius 39 then Renders a orange line between points (373, 31) and (277, 234).
; PLAN: r0=322(x), r1=4(y), r2=20(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x), r6=151(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=373(x1), r11=31(y1), r12=277(x2), r13=234(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 322
LDI r1, 4
LDI r2, 20
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 151
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 373
LDI r11, 31
LDI r12, 277
LDI r13, 234
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
