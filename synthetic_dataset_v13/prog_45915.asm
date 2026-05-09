; DESCRIPTION: Composite: Sets a single cyan pixel at (209, 32) then Draws a green circle centered at (59, 187) with radius 14.
; PLAN: r0=209(x), r1=32(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=187(y), r7=14(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 32
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 59
LDI r6, 187
LDI r7, 14
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
