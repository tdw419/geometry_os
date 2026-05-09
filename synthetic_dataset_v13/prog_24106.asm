; DESCRIPTION: Places a white line segment connecting (0, 210) to (446, 225).
; PLAN: r0=0(x1), r1=210(y1), r2=446(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 210
LDI r2, 446
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
