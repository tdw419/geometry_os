; DESCRIPTION: Composite: Places a white dot at position (18, 215) then Renders a white line between points (433, 224) and (468, 70).
; PLAN: r0=18(x), r1=215(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=433(x1), r6=224(y1), r7=468(x2), r8=70(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 18
LDI r1, 215
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 433
LDI r6, 224
LDI r7, 468
LDI r8, 70
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
