; DESCRIPTION: Composite: Places a cyan dot at position (132, 108) then Places a blue line segment connecting (511, 48) to (500, 227).
; PLAN: r0=132(x), r1=108(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=511(x1), r6=48(y1), r7=500(x2), r8=227(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 132
LDI r1, 108
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 511
LDI r6, 48
LDI r7, 500
LDI r8, 227
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
