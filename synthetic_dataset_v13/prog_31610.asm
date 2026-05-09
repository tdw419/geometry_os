; DESCRIPTION: Places a red line segment connecting (386, 124) to (108, 171).
; PLAN: r0=386(x1), r1=124(y1), r2=108(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 124
LDI r2, 108
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
