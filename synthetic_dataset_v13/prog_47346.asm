; DESCRIPTION: Composite: Places a white dot at position (67, 80) then Draws a blue line from (414, 58) to (333, 35).
; PLAN: r0=67(x), r1=80(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=414(x1), r6=58(y1), r7=333(x2), r8=35(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 80
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 414
LDI r6, 58
LDI r7, 333
LDI r8, 35
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
