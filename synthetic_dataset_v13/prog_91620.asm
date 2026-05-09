; DESCRIPTION: Composite: Places a red dot at position (510, 73) then Draws a green circle centered at (176, 210) with radius 20.
; PLAN: r0=510(x), r1=73(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=210(y), r7=20(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 510
LDI r1, 73
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 176
LDI r6, 210
LDI r7, 20
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
