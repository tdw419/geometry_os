; DESCRIPTION: Composite: Renders a black box of size 15x83 starting at (332, 106) then Sets a single green pixel at (492, 113).
; PLAN: r0=332(x), r1=106(y), r2=15(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x), r6=113(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 106
LDI r2, 15
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 113
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
