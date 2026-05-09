; DESCRIPTION: Draws a cyan line from (337, 204) to (335, 134).
; PLAN: r0=337(x1), r1=204(y1), r2=335(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 204
LDI r2, 335
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
