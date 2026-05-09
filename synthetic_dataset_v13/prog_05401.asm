; DESCRIPTION: Composite: Sets a single blue pixel at (446, 181) then Creates a cyan circular shape at (320, 213) with radius 36.
; PLAN: r0=446(x), r1=181(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=213(y), r7=36(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 446
LDI r1, 181
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 213
LDI r7, 36
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
