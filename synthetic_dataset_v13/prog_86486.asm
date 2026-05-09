; DESCRIPTION: Composite: Places a red dot at position (305, 219) then Renders a yellow disk with center (424, 220) and radius 10.
; PLAN: r0=305(x), r1=219(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=424(x), r6=220(y), r7=10(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 305
LDI r1, 219
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 424
LDI r6, 220
LDI r7, 10
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
