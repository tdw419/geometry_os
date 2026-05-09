; DESCRIPTION: Composite: Places a cyan dot at position (131, 72) then Places a green line segment connecting (59, 22) to (493, 0).
; PLAN: r0=131(x), r1=72(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=59(x1), r6=22(y1), r7=493(x2), r8=0(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 72
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 59
LDI r6, 22
LDI r7, 493
LDI r8, 0
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
