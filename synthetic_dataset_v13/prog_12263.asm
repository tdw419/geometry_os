; DESCRIPTION: Draws a yellow line from (218, 54) to (415, 16).
; PLAN: r0=218(x1), r1=54(y1), r2=415(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 54
LDI r2, 415
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
