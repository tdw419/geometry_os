; DESCRIPTION: Places a yellow line segment connecting (415, 152) to (59, 239).
; PLAN: r0=415(x1), r1=152(y1), r2=59(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 152
LDI r2, 59
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
