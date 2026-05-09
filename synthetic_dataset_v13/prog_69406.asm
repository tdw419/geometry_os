; DESCRIPTION: Composite: Places a green dot at position (400, 108) then Places a orange line segment connecting (116, 20) to (40, 213).
; PLAN: r0=400(x), r1=108(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=116(x1), r6=20(y1), r7=40(x2), r8=213(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 108
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 116
LDI r6, 20
LDI r7, 40
LDI r8, 213
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
