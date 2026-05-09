; DESCRIPTION: Draws a cyan line from (177, 188) to (164, 98).
; PLAN: r0=177(x1), r1=188(y1), r2=164(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 188
LDI r2, 164
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
