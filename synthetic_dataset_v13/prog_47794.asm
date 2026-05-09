; DESCRIPTION: Places a white line segment connecting (392, 172) to (481, 46).
; PLAN: r0=392(x1), r1=172(y1), r2=481(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 172
LDI r2, 481
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
