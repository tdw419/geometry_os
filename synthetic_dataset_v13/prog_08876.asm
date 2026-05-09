; DESCRIPTION: Composite: Renders a yellow line between points (199, 238) and (426, 221) then Renders a yellow disk with center (226, 57) and radius 40.
; PLAN: r0=199(x1), r1=238(y1), r2=426(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=57(y), r7=40(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 199
LDI r1, 238
LDI r2, 426
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 57
LDI r7, 40
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
