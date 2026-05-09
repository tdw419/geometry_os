; DESCRIPTION: Composite: Places a purple dot at position (346, 44) then Places a purple line segment connecting (453, 239) to (34, 229).
; PLAN: r0=346(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=453(x1), r6=239(y1), r7=34(x2), r8=229(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 44
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 453
LDI r6, 239
LDI r7, 34
LDI r8, 229
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
