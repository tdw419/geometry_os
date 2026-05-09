; DESCRIPTION: Composite: Places a cyan dot at position (249, 18) then Places a blue line segment connecting (495, 92) to (337, 191).
; PLAN: r0=249(x), r1=18(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=495(x1), r6=92(y1), r7=337(x2), r8=191(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 249
LDI r1, 18
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 495
LDI r6, 92
LDI r7, 337
LDI r8, 191
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
