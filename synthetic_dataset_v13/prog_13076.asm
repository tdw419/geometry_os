; DESCRIPTION: Composite: Places a yellow dot at position (76, 207) then Renders a cyan line between points (75, 169) and (244, 55).
; PLAN: r0=76(x), r1=207(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=75(x1), r6=169(y1), r7=244(x2), r8=55(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 207
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 75
LDI r6, 169
LDI r7, 244
LDI r8, 55
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
