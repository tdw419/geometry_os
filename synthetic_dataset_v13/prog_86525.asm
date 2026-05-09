; DESCRIPTION: Composite: Places a green dot at position (108, 185) then Places a cyan circle of radius 13 at center (406, 213).
; PLAN: r0=108(x), r1=185(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=213(y), r7=13(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 108
LDI r1, 185
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 406
LDI r6, 213
LDI r7, 13
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
