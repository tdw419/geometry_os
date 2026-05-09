; DESCRIPTION: Places a white line segment connecting (450, 79) to (180, 46).
; PLAN: r0=450(x1), r1=79(y1), r2=180(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 79
LDI r2, 180
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
