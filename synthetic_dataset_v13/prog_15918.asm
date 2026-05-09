; DESCRIPTION: Places a white line segment connecting (217, 213) to (389, 213).
; PLAN: r0=217(x1), r1=213(y1), r2=389(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 213
LDI r2, 389
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
