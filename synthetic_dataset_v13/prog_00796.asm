; DESCRIPTION: Places a green line segment connecting (487, 140) to (410, 236).
; PLAN: r0=487(x1), r1=140(y1), r2=410(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 140
LDI r2, 410
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
