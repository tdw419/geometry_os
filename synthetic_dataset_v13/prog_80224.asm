; DESCRIPTION: Composite: Places a blue dot at position (384, 149) then Renders a white line between points (464, 194) and (139, 98).
; PLAN: r0=384(x), r1=149(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=464(x1), r6=194(y1), r7=139(x2), r8=98(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 384
LDI r1, 149
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 464
LDI r6, 194
LDI r7, 139
LDI r8, 98
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
