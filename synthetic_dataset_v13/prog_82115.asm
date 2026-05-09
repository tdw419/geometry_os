; DESCRIPTION: Composite: Places a black dot at position (479, 178) then Places a purple circle of radius 20 at center (202, 192).
; PLAN: r0=479(x), r1=178(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=192(y), r7=20(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 479
LDI r1, 178
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 202
LDI r6, 192
LDI r7, 20
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
