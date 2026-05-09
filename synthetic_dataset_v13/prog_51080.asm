; DESCRIPTION: Composite: Sets a single cyan pixel at (1, 244) then Renders a white line between points (116, 149) and (443, 115).
; PLAN: r0=1(x), r1=244(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=116(x1), r6=149(y1), r7=443(x2), r8=115(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 1
LDI r1, 244
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 116
LDI r6, 149
LDI r7, 443
LDI r8, 115
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
