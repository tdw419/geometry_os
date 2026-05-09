; DESCRIPTION: Draws a cyan line from (118, 120) to (416, 160).
; PLAN: r0=118(x1), r1=120(y1), r2=416(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 120
LDI r2, 416
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
