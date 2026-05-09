; DESCRIPTION: Places a red line segment connecting (61, 82) to (487, 171).
; PLAN: r0=61(x1), r1=82(y1), r2=487(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 82
LDI r2, 487
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
