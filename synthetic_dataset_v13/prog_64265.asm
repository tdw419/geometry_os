; DESCRIPTION: Draws a yellow line from (275, 97) to (213, 174).
; PLAN: r0=275(x1), r1=97(y1), r2=213(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 97
LDI r2, 213
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
