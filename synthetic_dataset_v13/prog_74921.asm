; DESCRIPTION: Composite: Places a orange 30x52 rectangle at position (56, 117) then Renders a cyan line between points (54, 98) and (397, 209) then Renders a yellow disk with center (325, 140) and radius 13.
; PLAN: r0=56(x), r1=117(y), r2=30(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x1), r6=98(y1), r7=397(x2), r8=209(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=325(x), r11=140(y), r12=13(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 56
LDI r1, 117
LDI r2, 30
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 98
LDI r7, 397
LDI r8, 209
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 140
LDI r12, 13
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
