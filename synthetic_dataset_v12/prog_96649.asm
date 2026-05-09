; DESCRIPTION: Composite: Renders a cyan line between points (495, 37) and (275, 75) then Places a black circle of radius 53 at center (230, 61).
; PLAN: r0=495(x1), r1=37(y1), r2=275(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=61(y), r7=53(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 495
LDI r1, 37
LDI r2, 275
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 61
LDI r7, 53
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
