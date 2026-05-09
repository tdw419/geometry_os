; DESCRIPTION: Composite: Places a black dot at position (508, 56) then Renders a white line between points (108, 130) and (454, 99).
; PLAN: r0=508(x), r1=56(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=108(x1), r6=130(y1), r7=454(x2), r8=99(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 508
LDI r1, 56
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 108
LDI r6, 130
LDI r7, 454
LDI r8, 99
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
