; DESCRIPTION: Composite: Places a white line segment connecting (302, 208) to (183, 249) then Sets a single cyan pixel at (197, 236).
; PLAN: r0=302(x1), r1=208(y1), r2=183(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=236(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 302
LDI r1, 208
LDI r2, 183
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 236
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
