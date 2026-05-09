; DESCRIPTION: Composite: Sets a single white pixel at (310, 184) then Draws a green line from (276, 157) to (398, 23).
; PLAN: r0=310(x), r1=184(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=276(x1), r6=157(y1), r7=398(x2), r8=23(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 184
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 276
LDI r6, 157
LDI r7, 398
LDI r8, 23
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
