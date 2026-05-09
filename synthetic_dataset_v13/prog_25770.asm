; DESCRIPTION: Composite: Renders a black box of size 106x87 starting at (77, 29) then Places a green dot at position (83, 249).
; PLAN: r0=77(x), r1=29(y), r2=106(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x), r6=249(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 77
LDI r1, 29
LDI r2, 106
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 249
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
