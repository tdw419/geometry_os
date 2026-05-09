; DESCRIPTION: Draws a cyan line from (426, 183) to (465, 226).
; PLAN: r0=426(x1), r1=183(y1), r2=465(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 183
LDI r2, 465
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
