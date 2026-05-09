; DESCRIPTION: Draws a white line from (90, 37) to (398, 180).
; PLAN: r0=90(x1), r1=37(y1), r2=398(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 37
LDI r2, 398
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
