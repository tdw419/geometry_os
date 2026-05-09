; DESCRIPTION: Draws a green line from (352, 126) to (249, 94).
; PLAN: r0=352(x1), r1=126(y1), r2=249(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 126
LDI r2, 249
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
