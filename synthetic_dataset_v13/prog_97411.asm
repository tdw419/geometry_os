; DESCRIPTION: Draws a red line from (256, 38) to (46, 177).
; PLAN: r0=256(x1), r1=38(y1), r2=46(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 38
LDI r2, 46
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
