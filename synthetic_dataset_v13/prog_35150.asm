; DESCRIPTION: Composite: Renders a white line between points (28, 32) and (426, 90) then Places a red circle of radius 32 at center (131, 150) then Sets a single yellow pixel at (113, 113).
; PLAN: r0=28(x1), r1=32(y1), r2=426(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=150(y), r7=32(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=113(x), r11=113(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 28
LDI r1, 32
LDI r2, 426
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 150
LDI r7, 32
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 113
LDI r11, 113
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
