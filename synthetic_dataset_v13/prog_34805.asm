; DESCRIPTION: Composite: Places a white line segment connecting (177, 143) to (503, 153) then Places a cyan dot at position (333, 130).
; PLAN: r0=177(x1), r1=143(y1), r2=503(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=130(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 177
LDI r1, 143
LDI r2, 503
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 130
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
