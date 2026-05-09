; DESCRIPTION: Composite: Sets a single white pixel at (418, 56) then Renders a white line between points (86, 150) and (220, 38).
; PLAN: r0=418(x), r1=56(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=86(x1), r6=150(y1), r7=220(x2), r8=38(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 56
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 86
LDI r6, 150
LDI r7, 220
LDI r8, 38
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
