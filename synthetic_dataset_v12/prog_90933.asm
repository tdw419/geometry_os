; DESCRIPTION: Composite: Places a magenta dot at position (428, 239) then Renders a blue disk with center (242, 90) and radius 11.
; PLAN: r0=428(x), r1=239(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=90(y), r7=11(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 428
LDI r1, 239
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 90
LDI r7, 11
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
