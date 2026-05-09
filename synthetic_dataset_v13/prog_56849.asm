; DESCRIPTION: Composite: Places a black circle of radius 61 at center (289, 182) then Renders a white line between points (190, 91) and (197, 151).
; PLAN: r0=289(x), r1=182(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x1), r6=91(y1), r7=197(x2), r8=151(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 182
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 91
LDI r7, 197
LDI r8, 151
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
