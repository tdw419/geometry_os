; DESCRIPTION: Draws a cyan line from (143, 25) to (250, 56).
; PLAN: r0=143(x1), r1=25(y1), r2=250(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 25
LDI r2, 250
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
