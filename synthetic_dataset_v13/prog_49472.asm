; DESCRIPTION: Composite: Draws a cyan line from (28, 44) to (181, 190) then Creates a white circular shape at (131, 136) with radius 74.
; PLAN: r0=28(x1), r1=44(y1), r2=181(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=136(y), r7=74(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 28
LDI r1, 44
LDI r2, 181
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 136
LDI r7, 74
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
