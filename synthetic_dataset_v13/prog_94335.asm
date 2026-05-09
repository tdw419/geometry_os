; DESCRIPTION: Composite: Draws a green line from (272, 171) to (199, 139) then Places a white dot at position (480, 234).
; PLAN: r0=272(x1), r1=171(y1), r2=199(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=234(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 171
LDI r2, 199
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 234
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
