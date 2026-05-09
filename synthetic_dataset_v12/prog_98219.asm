; DESCRIPTION: Draws a cyan line from (235, 70) to (340, 70).
; PLAN: r0=235(x1), r1=70(y1), r2=340(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 70
LDI r2, 340
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
