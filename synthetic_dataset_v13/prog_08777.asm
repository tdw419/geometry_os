; DESCRIPTION: Draws a red line from (380, 188) to (264, 236).
; PLAN: r0=380(x1), r1=188(y1), r2=264(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 188
LDI r2, 264
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
