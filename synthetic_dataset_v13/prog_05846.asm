; DESCRIPTION: Draws a cyan line from (161, 193) to (413, 7).
; PLAN: r0=161(x1), r1=193(y1), r2=413(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 193
LDI r2, 413
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
