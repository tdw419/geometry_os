; DESCRIPTION: Composite: Draws a white line from (244, 2) to (462, 66) then Sets a single magenta pixel at (346, 135).
; PLAN: r0=244(x1), r1=2(y1), r2=462(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=135(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 244
LDI r1, 2
LDI r2, 462
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 135
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
