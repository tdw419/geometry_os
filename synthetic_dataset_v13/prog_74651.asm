; DESCRIPTION: Draws a cyan line from (490, 242) to (455, 235).
; PLAN: r0=490(x1), r1=242(y1), r2=455(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 242
LDI r2, 455
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
