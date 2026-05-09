; DESCRIPTION: Places a cyan line segment connecting (323, 5) to (305, 55).
; PLAN: r0=323(x1), r1=5(y1), r2=305(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 5
LDI r2, 305
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
