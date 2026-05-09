; DESCRIPTION: Draws a red line from (352, 214) to (393, 195).
; PLAN: r0=352(x1), r1=214(y1), r2=393(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 214
LDI r2, 393
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
