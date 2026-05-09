; DESCRIPTION: Places a white line segment connecting (493, 161) to (410, 82).
; PLAN: r0=493(x1), r1=161(y1), r2=410(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 161
LDI r2, 410
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
