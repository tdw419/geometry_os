; DESCRIPTION: Composite: Places a orange circle of radius 30 at center (354, 172) then Places a yellow line segment connecting (346, 112) to (190, 128).
; PLAN: r0=354(x), r1=172(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x1), r6=112(y1), r7=190(x2), r8=128(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 172
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 112
LDI r7, 190
LDI r8, 128
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
