; DESCRIPTION: Places a white line segment connecting (470, 116) to (198, 125).
; PLAN: r0=470(x1), r1=116(y1), r2=198(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 116
LDI r2, 198
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
