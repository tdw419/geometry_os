; DESCRIPTION: Places a black line segment connecting (279, 152) to (502, 61).
; PLAN: r0=279(x1), r1=152(y1), r2=502(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 152
LDI r2, 502
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
