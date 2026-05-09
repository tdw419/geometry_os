; DESCRIPTION: Places a yellow line segment connecting (436, 47) to (386, 146).
; PLAN: r0=436(x1), r1=47(y1), r2=386(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 47
LDI r2, 386
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
