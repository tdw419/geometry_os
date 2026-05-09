; DESCRIPTION: Composite: Sets a single white pixel at (220, 105) then Renders a purple line between points (320, 114) and (95, 91).
; PLAN: r0=220(x), r1=105(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=320(x1), r6=114(y1), r7=95(x2), r8=91(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 220
LDI r1, 105
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 114
LDI r7, 95
LDI r8, 91
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
