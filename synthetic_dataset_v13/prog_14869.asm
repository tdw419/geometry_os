; DESCRIPTION: Composite: Places a cyan dot at position (301, 98) then Places a yellow line segment connecting (509, 17) to (427, 213).
; PLAN: r0=301(x), r1=98(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=509(x1), r6=17(y1), r7=427(x2), r8=213(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 98
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 509
LDI r6, 17
LDI r7, 427
LDI r8, 213
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
