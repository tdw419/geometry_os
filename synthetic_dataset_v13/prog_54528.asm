; DESCRIPTION: Draws a green line from (126, 199) to (346, 160).
; PLAN: r0=126(x1), r1=199(y1), r2=346(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 199
LDI r2, 346
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
