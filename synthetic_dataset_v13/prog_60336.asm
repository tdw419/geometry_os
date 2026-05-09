; DESCRIPTION: Composite: Places a cyan dot at position (124, 124) then Draws a black line from (225, 244) to (42, 30).
; PLAN: r0=124(x), r1=124(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=225(x1), r6=244(y1), r7=42(x2), r8=30(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 124
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 225
LDI r6, 244
LDI r7, 42
LDI r8, 30
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
