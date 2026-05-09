; DESCRIPTION: Places a white line segment connecting (26, 209) to (492, 208).
; PLAN: r0=26(x1), r1=209(y1), r2=492(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 209
LDI r2, 492
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
