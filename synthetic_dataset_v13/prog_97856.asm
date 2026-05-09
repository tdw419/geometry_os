; DESCRIPTION: Composite: Sets a single magenta pixel at (206, 139) then Places a blue line segment connecting (202, 58) to (350, 196).
; PLAN: r0=206(x), r1=139(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=202(x1), r6=58(y1), r7=350(x2), r8=196(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 139
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 58
LDI r7, 350
LDI r8, 196
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
