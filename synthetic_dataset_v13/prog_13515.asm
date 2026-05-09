; DESCRIPTION: Composite: Places a red line segment connecting (171, 195) to (198, 208) then Places a yellow dot at position (88, 69).
; PLAN: r0=171(x1), r1=195(y1), r2=198(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=69(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 171
LDI r1, 195
LDI r2, 198
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 69
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
