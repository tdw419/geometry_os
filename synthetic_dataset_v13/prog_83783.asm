; DESCRIPTION: Draws a white line from (388, 253) to (386, 180).
; PLAN: r0=388(x1), r1=253(y1), r2=386(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 253
LDI r2, 386
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
