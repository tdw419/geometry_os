; DESCRIPTION: Draws a white line from (417, 126) to (290, 208).
; PLAN: r0=417(x1), r1=126(y1), r2=290(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 126
LDI r2, 290
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
