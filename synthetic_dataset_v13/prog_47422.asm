; DESCRIPTION: Composite: Renders a cyan line between points (308, 233) and (344, 229) then Places a white dot at position (423, 236).
; PLAN: r0=308(x1), r1=233(y1), r2=344(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=236(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 308
LDI r1, 233
LDI r2, 344
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 236
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
