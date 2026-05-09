; DESCRIPTION: Composite: Places a yellow dot at position (491, 152) then Renders a white line between points (337, 195) and (437, 244).
; PLAN: r0=491(x), r1=152(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=337(x1), r6=195(y1), r7=437(x2), r8=244(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 491
LDI r1, 152
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 337
LDI r6, 195
LDI r7, 437
LDI r8, 244
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
