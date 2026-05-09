; DESCRIPTION: Draws a white line from (231, 172) to (171, 132).
; PLAN: r0=231(x1), r1=172(y1), r2=171(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 172
LDI r2, 171
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
