; DESCRIPTION: Composite: Renders a black line between points (511, 15) and (348, 255) then Places a red circle of radius 32 at center (480, 37).
; PLAN: r0=511(x1), r1=15(y1), r2=348(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=37(y), r7=32(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 511
LDI r1, 15
LDI r2, 348
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 37
LDI r7, 32
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
