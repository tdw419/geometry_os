; DESCRIPTION: Draws a red line from (51, 213) to (48, 249).
; PLAN: r0=51(x1), r1=213(y1), r2=48(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 213
LDI r2, 48
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
