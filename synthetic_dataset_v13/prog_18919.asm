; DESCRIPTION: Composite: Places a orange line segment connecting (411, 234) to (426, 36) then Places a cyan dot at position (296, 193).
; PLAN: r0=411(x1), r1=234(y1), r2=426(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=193(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 411
LDI r1, 234
LDI r2, 426
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 193
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
