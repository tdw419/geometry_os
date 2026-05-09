; DESCRIPTION: Composite: Sets a single black pixel at (480, 229) then Draws a white line from (141, 90) to (440, 67).
; PLAN: r0=480(x), r1=229(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=141(x1), r6=90(y1), r7=440(x2), r8=67(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 480
LDI r1, 229
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 141
LDI r6, 90
LDI r7, 440
LDI r8, 67
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
