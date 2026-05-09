; DESCRIPTION: Composite: Places a magenta dot at position (331, 59) then Places a white line segment connecting (278, 185) to (68, 248).
; PLAN: r0=331(x), r1=59(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=278(x1), r6=185(y1), r7=68(x2), r8=248(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 331
LDI r1, 59
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 278
LDI r6, 185
LDI r7, 68
LDI r8, 248
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
