; DESCRIPTION: Composite: Places a purple dot at position (482, 242) then Renders a white disk with center (435, 146) and radius 62.
; PLAN: r0=482(x), r1=242(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=435(x), r6=146(y), r7=62(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 482
LDI r1, 242
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 435
LDI r6, 146
LDI r7, 62
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
