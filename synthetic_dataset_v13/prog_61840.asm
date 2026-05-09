; DESCRIPTION: Composite: Places a red dot at position (274, 198) then Renders a green disk with center (281, 81) and radius 40.
; PLAN: r0=274(x), r1=198(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=81(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 274
LDI r1, 198
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 281
LDI r6, 81
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
