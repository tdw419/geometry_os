; DESCRIPTION: Draws a black line from (243, 113) to (499, 143).
; PLAN: r0=243(x1), r1=113(y1), r2=499(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 113
LDI r2, 499
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
