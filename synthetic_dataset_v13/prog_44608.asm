; DESCRIPTION: Draws a white line from (383, 213) to (500, 200).
; PLAN: r0=383(x1), r1=213(y1), r2=500(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 213
LDI r2, 500
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
