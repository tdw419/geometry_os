; DESCRIPTION: Composite: Sets a single green pixel at (206, 175) then Places a red line segment connecting (20, 59) to (373, 173).
; PLAN: r0=206(x), r1=175(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=20(x1), r6=59(y1), r7=373(x2), r8=173(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 175
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 20
LDI r6, 59
LDI r7, 373
LDI r8, 173
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
