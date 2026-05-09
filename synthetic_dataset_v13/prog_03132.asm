; DESCRIPTION: Draws a white line from (146, 36) to (30, 226).
; PLAN: r0=146(x1), r1=36(y1), r2=30(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 36
LDI r2, 30
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
