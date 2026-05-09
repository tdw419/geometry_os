; DESCRIPTION: Places a cyan line segment connecting (138, 79) to (360, 180).
; PLAN: r0=138(x1), r1=79(y1), r2=360(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 79
LDI r2, 360
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
