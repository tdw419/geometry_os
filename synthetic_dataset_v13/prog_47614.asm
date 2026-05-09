; DESCRIPTION: Places a red line segment connecting (320, 177) to (387, 32).
; PLAN: r0=320(x1), r1=177(y1), r2=387(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 177
LDI r2, 387
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
