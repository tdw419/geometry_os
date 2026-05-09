; DESCRIPTION: Composite: Sets a single black pixel at (207, 114) then Renders a green disk with center (213, 152) and radius 72.
; PLAN: r0=207(x), r1=114(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=213(x), r6=152(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 207
LDI r1, 114
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 213
LDI r6, 152
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
