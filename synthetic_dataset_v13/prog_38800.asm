; DESCRIPTION: Places a white line segment connecting (177, 1) to (277, 27).
; PLAN: r0=177(x1), r1=1(y1), r2=277(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 1
LDI r2, 277
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
