; DESCRIPTION: Draws a red line from (263, 194) to (393, 236).
; PLAN: r0=263(x1), r1=194(y1), r2=393(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 194
LDI r2, 393
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
