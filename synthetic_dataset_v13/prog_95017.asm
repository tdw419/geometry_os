; DESCRIPTION: Draws a white line from (177, 211) to (428, 213).
; PLAN: r0=177(x1), r1=211(y1), r2=428(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 211
LDI r2, 428
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
