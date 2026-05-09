; DESCRIPTION: Places a yellow line segment connecting (152, 124) to (346, 43).
; PLAN: r0=152(x1), r1=124(y1), r2=346(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 124
LDI r2, 346
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
