; DESCRIPTION: Composite: Draws a magenta line from (502, 119) to (144, 115) then Sets a single green pixel at (445, 188).
; PLAN: r0=502(x1), r1=119(y1), r2=144(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=445(x), r6=188(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 502
LDI r1, 119
LDI r2, 144
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 188
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
