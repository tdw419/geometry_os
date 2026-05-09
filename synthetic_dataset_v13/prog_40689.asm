; DESCRIPTION: Places a green line segment connecting (172, 230) to (152, 167).
; PLAN: r0=172(x1), r1=230(y1), r2=152(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 230
LDI r2, 152
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
