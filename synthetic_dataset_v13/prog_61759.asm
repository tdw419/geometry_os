; DESCRIPTION: Places a white line segment connecting (481, 121) to (403, 166).
; PLAN: r0=481(x1), r1=121(y1), r2=403(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 121
LDI r2, 403
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
