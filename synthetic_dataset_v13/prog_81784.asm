; DESCRIPTION: Composite: Places a cyan dot at position (366, 106) then Draws a green line from (470, 248) to (313, 200).
; PLAN: r0=366(x), r1=106(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=470(x1), r6=248(y1), r7=313(x2), r8=200(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 106
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 470
LDI r6, 248
LDI r7, 313
LDI r8, 200
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
