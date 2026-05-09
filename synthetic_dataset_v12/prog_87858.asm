; DESCRIPTION: Composite: Places a black dot at position (305, 246) then Renders a cyan line between points (431, 171) and (395, 10).
; PLAN: r0=305(x), r1=246(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=431(x1), r6=171(y1), r7=395(x2), r8=10(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 246
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 431
LDI r6, 171
LDI r7, 395
LDI r8, 10
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
