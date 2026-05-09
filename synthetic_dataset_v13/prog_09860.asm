; DESCRIPTION: Composite: Renders a cyan line between points (48, 137) and (469, 117) then Sets a single white pixel at (462, 146).
; PLAN: r0=48(x1), r1=137(y1), r2=469(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=462(x), r6=146(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 48
LDI r1, 137
LDI r2, 469
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 146
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
