; DESCRIPTION: Draws a cyan line from (395, 59) to (45, 218).
; PLAN: r0=395(x1), r1=59(y1), r2=45(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 59
LDI r2, 45
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
