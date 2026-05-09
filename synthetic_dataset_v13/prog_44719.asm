; DESCRIPTION: Places a white line segment connecting (387, 63) to (103, 255).
; PLAN: r0=387(x1), r1=63(y1), r2=103(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 63
LDI r2, 103
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
