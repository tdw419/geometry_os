; DESCRIPTION: Composite: Draws a green line from (225, 209) to (6, 57) then Sets a single white pixel at (413, 45).
; PLAN: r0=225(x1), r1=209(y1), r2=6(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=45(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 225
LDI r1, 209
LDI r2, 6
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 45
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
