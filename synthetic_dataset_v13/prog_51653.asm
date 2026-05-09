; DESCRIPTION: Draws a cyan line from (167, 65) to (185, 236).
; PLAN: r0=167(x1), r1=65(y1), r2=185(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 65
LDI r2, 185
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
