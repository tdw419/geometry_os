; DESCRIPTION: Composite: Places a green dot at position (406, 34) then Renders a black line between points (275, 130) and (77, 93).
; PLAN: r0=406(x), r1=34(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=275(x1), r6=130(y1), r7=77(x2), r8=93(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 34
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 275
LDI r6, 130
LDI r7, 77
LDI r8, 93
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
