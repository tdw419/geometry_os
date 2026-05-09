; DESCRIPTION: Composite: Places a purple 51x23 rectangle at position (404, 17) then Renders a red disk with center (441, 84) and radius 32.
; PLAN: r0=404(x), r1=17(y), r2=51(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x), r6=84(y), r7=32(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 404
LDI r1, 17
LDI r2, 51
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 84
LDI r7, 32
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
