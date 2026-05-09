; DESCRIPTION: Places a cyan line segment connecting (180, 186) to (395, 6).
; PLAN: r0=180(x1), r1=186(y1), r2=395(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 186
LDI r2, 395
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
