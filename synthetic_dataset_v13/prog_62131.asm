; DESCRIPTION: Places a red line segment connecting (298, 120) to (365, 75).
; PLAN: r0=298(x1), r1=120(y1), r2=365(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 120
LDI r2, 365
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
