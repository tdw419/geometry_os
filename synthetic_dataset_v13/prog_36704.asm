; DESCRIPTION: Composite: Places a orange dot at position (240, 108) then Renders a magenta disk with center (165, 103) and radius 76.
; PLAN: r0=240(x), r1=108(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=103(y), r7=76(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 240
LDI r1, 108
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 165
LDI r6, 103
LDI r7, 76
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
