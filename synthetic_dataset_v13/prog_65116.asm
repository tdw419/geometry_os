; DESCRIPTION: Places a red line segment connecting (295, 125) to (410, 135).
; PLAN: r0=295(x1), r1=125(y1), r2=410(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 125
LDI r2, 410
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
