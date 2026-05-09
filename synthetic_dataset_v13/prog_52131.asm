; DESCRIPTION: Composite: Places a white dot at position (91, 120) then Renders a yellow line between points (122, 52) and (503, 16).
; PLAN: r0=91(x), r1=120(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=122(x1), r6=52(y1), r7=503(x2), r8=16(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 120
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 122
LDI r6, 52
LDI r7, 503
LDI r8, 16
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
