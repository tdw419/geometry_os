; DESCRIPTION: Composite: Sets a single purple pixel at (244, 108) then Draws a yellow line from (27, 80) to (416, 167).
; PLAN: r0=244(x), r1=108(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=27(x1), r6=80(y1), r7=416(x2), r8=167(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 108
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 27
LDI r6, 80
LDI r7, 416
LDI r8, 167
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
