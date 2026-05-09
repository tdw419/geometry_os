; DESCRIPTION: Composite: Places a white dot at position (13, 113) then Renders a white line between points (271, 235) and (198, 1).
; PLAN: r0=13(x), r1=113(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=271(x1), r6=235(y1), r7=198(x2), r8=1(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 13
LDI r1, 113
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 271
LDI r6, 235
LDI r7, 198
LDI r8, 1
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
