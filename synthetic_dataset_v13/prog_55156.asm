; DESCRIPTION: Composite: Renders a purple disk with center (117, 159) and radius 76 then Places a cyan 99x66 rectangle at position (129, 128) then Places a red line segment connecting (414, 39) to (501, 215).
; PLAN: r0=117(x), r1=159(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x), r6=128(y), r7=99(width), r8=66(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x1), r11=39(y1), r12=501(x2), r13=215(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 117
LDI r1, 159
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 128
LDI r7, 99
LDI r8, 66
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 39
LDI r12, 501
LDI r13, 215
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
