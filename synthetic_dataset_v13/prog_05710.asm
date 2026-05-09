; DESCRIPTION: Composite: Places a black line segment connecting (409, 103) to (7, 20) then Sets a single black pixel at (284, 177).
; PLAN: r0=409(x1), r1=103(y1), r2=7(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=177(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 409
LDI r1, 103
LDI r2, 7
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 177
LDI r7, 0x000000
PSET r5, r6, r7
HALT
