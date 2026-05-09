; DESCRIPTION: Draws a cyan line from (226, 249) to (417, 235).
; PLAN: r0=226(x1), r1=249(y1), r2=417(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 249
LDI r2, 417
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
