; DESCRIPTION: Composite: Creates a cyan circular shape at (265, 181) with radius 35 then Renders a cyan box of size 53x22 starting at (349, 207) then Renders a yellow line between points (471, 189) and (272, 19).
; PLAN: r0=265(x), r1=181(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=207(y), r7=53(width), r8=22(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=471(x1), r11=189(y1), r12=272(x2), r13=19(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 181
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 207
LDI r7, 53
LDI r8, 22
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 189
LDI r12, 272
LDI r13, 19
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
