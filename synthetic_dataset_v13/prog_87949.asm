; DESCRIPTION: Composite: Renders a purple disk with center (461, 85) and radius 28 then Renders a cyan line between points (114, 68) and (71, 242).
; PLAN: r0=461(x), r1=85(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=114(x1), r6=68(y1), r7=71(x2), r8=242(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 85
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 114
LDI r6, 68
LDI r7, 71
LDI r8, 242
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
