; DESCRIPTION: Composite: Places a cyan dot at position (452, 138) then Places a yellow line segment connecting (289, 48) to (178, 222).
; PLAN: r0=452(x), r1=138(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=289(x1), r6=48(y1), r7=178(x2), r8=222(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 452
LDI r1, 138
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 289
LDI r6, 48
LDI r7, 178
LDI r8, 222
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
