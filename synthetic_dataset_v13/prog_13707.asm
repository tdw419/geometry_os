; DESCRIPTION: Places a white line segment connecting (360, 51) to (146, 239).
; PLAN: r0=360(x1), r1=51(y1), r2=146(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 51
LDI r2, 146
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
