; DESCRIPTION: Composite: Places a red circle of radius 36 at center (135, 167) then Places a yellow dot at position (400, 219).
; PLAN: r0=135(x), r1=167(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=219(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 135
LDI r1, 167
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 219
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
