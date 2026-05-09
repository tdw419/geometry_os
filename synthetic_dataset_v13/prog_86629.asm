; DESCRIPTION: Draws a cyan line from (253, 61) to (385, 226).
; PLAN: r0=253(x1), r1=61(y1), r2=385(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 61
LDI r2, 385
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
