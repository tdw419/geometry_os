; DESCRIPTION: Composite: Sets a single black pixel at (462, 180) then Draws a cyan line from (327, 33) to (123, 195).
; PLAN: r0=462(x), r1=180(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=327(x1), r6=33(y1), r7=123(x2), r8=195(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 180
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 327
LDI r6, 33
LDI r7, 123
LDI r8, 195
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
