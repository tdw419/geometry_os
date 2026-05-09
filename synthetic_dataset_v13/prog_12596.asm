; DESCRIPTION: Composite: Draws a yellow line from (407, 28) to (176, 244) then Creates a cyan circular shape at (66, 193) with radius 53.
; PLAN: r0=407(x1), r1=28(y1), r2=176(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=193(y), r7=53(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 407
LDI r1, 28
LDI r2, 176
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 193
LDI r7, 53
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
