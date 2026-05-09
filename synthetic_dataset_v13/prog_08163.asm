; DESCRIPTION: Composite: Renders a red line between points (58, 230) and (372, 67) then Creates a cyan circular shape at (65, 143) with radius 51.
; PLAN: r0=58(x1), r1=230(y1), r2=372(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=143(y), r7=51(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 58
LDI r1, 230
LDI r2, 372
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 143
LDI r7, 51
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
