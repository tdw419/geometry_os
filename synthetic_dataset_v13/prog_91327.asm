; DESCRIPTION: Places a white line segment connecting (202, 129) to (493, 167).
; PLAN: r0=202(x1), r1=129(y1), r2=493(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 129
LDI r2, 493
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
