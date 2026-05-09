; DESCRIPTION: Composite: Renders a cyan line between points (242, 182) and (341, 65) then Creates a white circular shape at (180, 228) with radius 17.
; PLAN: r0=242(x1), r1=182(y1), r2=341(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=228(y), r7=17(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 242
LDI r1, 182
LDI r2, 341
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 228
LDI r7, 17
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
