; DESCRIPTION: Composite: Places a black dot at position (189, 221) then Places a blue line segment connecting (25, 69) to (406, 239).
; PLAN: r0=189(x), r1=221(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=25(x1), r6=69(y1), r7=406(x2), r8=239(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 221
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 25
LDI r6, 69
LDI r7, 406
LDI r8, 239
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
