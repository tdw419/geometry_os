; DESCRIPTION: Draws a cyan line from (19, 229) to (38, 184).
; PLAN: r0=19(x1), r1=229(y1), r2=38(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 229
LDI r2, 38
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
