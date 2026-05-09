; DESCRIPTION: Places a white line segment connecting (180, 222) to (386, 98).
; PLAN: r0=180(x1), r1=222(y1), r2=386(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 222
LDI r2, 386
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
