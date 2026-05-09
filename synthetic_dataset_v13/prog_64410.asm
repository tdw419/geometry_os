; DESCRIPTION: Draws a cyan line from (455, 183) to (178, 235).
; PLAN: r0=455(x1), r1=183(y1), r2=178(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 183
LDI r2, 178
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
