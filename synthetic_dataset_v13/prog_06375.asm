; DESCRIPTION: Places a green line segment connecting (445, 102) to (168, 82).
; PLAN: r0=445(x1), r1=102(y1), r2=168(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 102
LDI r2, 168
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
