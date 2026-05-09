; DESCRIPTION: Composite: Places a cyan line segment connecting (382, 217) to (354, 165) then Places a orange circle of radius 72 at center (258, 137).
; PLAN: r0=382(x1), r1=217(y1), r2=354(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=137(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 382
LDI r1, 217
LDI r2, 354
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 137
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
