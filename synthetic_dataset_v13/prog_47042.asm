; DESCRIPTION: Places a white line segment connecting (510, 243) to (164, 165).
; PLAN: r0=510(x1), r1=243(y1), r2=164(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 243
LDI r2, 164
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
