; DESCRIPTION: Draws a white line from (499, 195) to (36, 190).
; PLAN: r0=499(x1), r1=195(y1), r2=36(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 195
LDI r2, 36
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
