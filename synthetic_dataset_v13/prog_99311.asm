; DESCRIPTION: Places a cyan line segment connecting (6, 70) to (445, 82).
; PLAN: r0=6(x1), r1=70(y1), r2=445(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 70
LDI r2, 445
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
