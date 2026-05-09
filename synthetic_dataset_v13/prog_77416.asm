; DESCRIPTION: Draws a cyan line from (370, 4) to (81, 226).
; PLAN: r0=370(x1), r1=4(y1), r2=81(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 4
LDI r2, 81
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
