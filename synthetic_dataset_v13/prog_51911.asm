; DESCRIPTION: Draws a white line from (248, 126) to (274, 134).
; PLAN: r0=248(x1), r1=126(y1), r2=274(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 126
LDI r2, 274
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
