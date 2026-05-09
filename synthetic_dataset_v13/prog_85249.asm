; DESCRIPTION: Composite: Creates a cyan circular shape at (227, 69) with radius 29 then Places a yellow line segment connecting (87, 238) to (190, 225).
; PLAN: r0=227(x), r1=69(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x1), r6=238(y1), r7=190(x2), r8=225(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 69
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 238
LDI r7, 190
LDI r8, 225
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
