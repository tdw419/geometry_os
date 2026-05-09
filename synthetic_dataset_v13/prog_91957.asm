; DESCRIPTION: Draws a cyan line from (486, 226) to (274, 199).
; PLAN: r0=486(x1), r1=226(y1), r2=274(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 226
LDI r2, 274
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
