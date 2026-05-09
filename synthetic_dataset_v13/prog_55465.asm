; DESCRIPTION: Composite: Places a green dot at position (114, 72) then Renders a white line between points (18, 71) and (189, 227).
; PLAN: r0=114(x), r1=72(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=18(x1), r6=71(y1), r7=189(x2), r8=227(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 72
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 18
LDI r6, 71
LDI r7, 189
LDI r8, 227
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
