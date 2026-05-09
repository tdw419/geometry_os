; DESCRIPTION: Places a white line segment connecting (243, 4) to (499, 125).
; PLAN: r0=243(x1), r1=4(y1), r2=499(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 4
LDI r2, 499
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
