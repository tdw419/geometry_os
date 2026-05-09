; DESCRIPTION: Composite: Renders a cyan line between points (190, 238) and (193, 196) then Creates a cyan circular shape at (176, 220) with radius 26.
; PLAN: r0=190(x1), r1=238(y1), r2=193(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=220(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 190
LDI r1, 238
LDI r2, 193
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 220
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
