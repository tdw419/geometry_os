; DESCRIPTION: Draws a green line from (45, 215) to (354, 235).
; PLAN: r0=45(x1), r1=215(y1), r2=354(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 215
LDI r2, 354
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
