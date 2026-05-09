; DESCRIPTION: Composite: Places a orange dot at position (217, 207) then Places a blue line segment connecting (269, 190) to (457, 46).
; PLAN: r0=217(x), r1=207(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=269(x1), r6=190(y1), r7=457(x2), r8=46(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 207
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 269
LDI r6, 190
LDI r7, 457
LDI r8, 46
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
