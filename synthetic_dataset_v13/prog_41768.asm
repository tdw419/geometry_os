; DESCRIPTION: Composite: Places a green dot at position (426, 230) then Places a purple circle of radius 38 at center (374, 154).
; PLAN: r0=426(x), r1=230(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=154(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 426
LDI r1, 230
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 374
LDI r6, 154
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
