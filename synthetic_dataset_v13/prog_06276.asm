; DESCRIPTION: Draws a cyan line from (153, 236) to (301, 235).
; PLAN: r0=153(x1), r1=236(y1), r2=301(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 236
LDI r2, 301
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
