; DESCRIPTION: Composite: Sets a single green pixel at (321, 108) then Draws a red line from (386, 21) to (406, 54).
; PLAN: r0=321(x), r1=108(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=386(x1), r6=21(y1), r7=406(x2), r8=54(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 108
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 386
LDI r6, 21
LDI r7, 406
LDI r8, 54
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
