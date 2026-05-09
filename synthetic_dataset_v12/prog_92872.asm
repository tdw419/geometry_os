; DESCRIPTION: Composite: Renders a green line between points (327, 28) and (39, 84) then Places a black circle of radius 78 at center (285, 171).
; PLAN: r0=327(x1), r1=28(y1), r2=39(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=171(y), r7=78(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 327
LDI r1, 28
LDI r2, 39
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 171
LDI r7, 78
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
