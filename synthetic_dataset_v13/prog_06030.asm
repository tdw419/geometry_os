; DESCRIPTION: Composite: Renders a white line between points (242, 201) and (418, 124) then Places a cyan circle of radius 37 at center (242, 97).
; PLAN: r0=242(x1), r1=201(y1), r2=418(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=97(y), r7=37(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 242
LDI r1, 201
LDI r2, 418
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 97
LDI r7, 37
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
