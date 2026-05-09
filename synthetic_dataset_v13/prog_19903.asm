; DESCRIPTION: Composite: Places a cyan line segment connecting (354, 80) to (271, 230) then Places a black circle of radius 51 at center (189, 65).
; PLAN: r0=354(x1), r1=80(y1), r2=271(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=65(y), r7=51(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 354
LDI r1, 80
LDI r2, 271
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 65
LDI r7, 51
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
