; DESCRIPTION: Composite: Sets a single cyan pixel at (295, 237) then Renders a yellow disk with center (264, 124) and radius 59.
; PLAN: r0=295(x), r1=237(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=264(x), r6=124(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 295
LDI r1, 237
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 264
LDI r6, 124
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
