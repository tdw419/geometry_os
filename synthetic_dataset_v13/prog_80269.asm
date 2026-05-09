; DESCRIPTION: Places a yellow line segment connecting (434, 152) to (416, 178).
; PLAN: r0=434(x1), r1=152(y1), r2=416(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 152
LDI r2, 416
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
