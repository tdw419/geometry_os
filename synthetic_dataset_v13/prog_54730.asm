; DESCRIPTION: Draws a cyan line from (374, 140) to (75, 226).
; PLAN: r0=374(x1), r1=140(y1), r2=75(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 140
LDI r2, 75
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
