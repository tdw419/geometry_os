; DESCRIPTION: Composite: Places a yellow dot at position (242, 17) then Renders a cyan disk with center (59, 156) and radius 45.
; PLAN: r0=242(x), r1=17(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=156(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 242
LDI r1, 17
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 59
LDI r6, 156
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
