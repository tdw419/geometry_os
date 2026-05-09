; DESCRIPTION: Places a black line segment connecting (98, 220) to (213, 174).
; PLAN: r0=98(x1), r1=220(y1), r2=213(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 220
LDI r2, 213
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
