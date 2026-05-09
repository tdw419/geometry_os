; DESCRIPTION: Composite: Sets a single green pixel at (405, 59) then Places a red line segment connecting (108, 69) to (314, 4).
; PLAN: r0=405(x), r1=59(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=108(x1), r6=69(y1), r7=314(x2), r8=4(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 59
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 108
LDI r6, 69
LDI r7, 314
LDI r8, 4
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
