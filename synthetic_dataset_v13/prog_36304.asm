; DESCRIPTION: Places a blue line segment connecting (48, 129) to (328, 90).
; PLAN: r0=48(x1), r1=129(y1), r2=328(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 129
LDI r2, 328
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
