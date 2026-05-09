; DESCRIPTION: Places a blue line segment connecting (450, 242) to (507, 174).
; PLAN: r0=450(x1), r1=242(y1), r2=507(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 242
LDI r2, 507
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
