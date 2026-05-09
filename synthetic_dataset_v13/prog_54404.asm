; DESCRIPTION: Composite: Sets a single white pixel at (65, 128) then Draws a green line from (197, 44) to (80, 126).
; PLAN: r0=65(x), r1=128(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=197(x1), r6=44(y1), r7=80(x2), r8=126(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 128
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 197
LDI r6, 44
LDI r7, 80
LDI r8, 126
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
