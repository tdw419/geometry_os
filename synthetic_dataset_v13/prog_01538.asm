; DESCRIPTION: Draws a cyan line from (184, 89) to (262, 102).
; PLAN: r0=184(x1), r1=89(y1), r2=262(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 89
LDI r2, 262
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
