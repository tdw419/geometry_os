; DESCRIPTION: Composite: Creates a cyan circular shape at (330, 186) with radius 21 then Places a green dot at position (217, 6).
; PLAN: r0=330(x), r1=186(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=217(x), r6=6(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 330
LDI r1, 186
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 217
LDI r6, 6
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
