; DESCRIPTION: Draws a cyan line from (262, 225) to (323, 60).
; PLAN: r0=262(x1), r1=225(y1), r2=323(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 225
LDI r2, 323
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
