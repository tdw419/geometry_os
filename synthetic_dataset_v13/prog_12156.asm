; DESCRIPTION: Places a white line segment connecting (277, 71) to (309, 152).
; PLAN: r0=277(x1), r1=71(y1), r2=309(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 71
LDI r2, 309
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
