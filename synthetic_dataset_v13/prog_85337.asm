; DESCRIPTION: Draws a cyan line from (395, 33) to (225, 49).
; PLAN: r0=395(x1), r1=33(y1), r2=225(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 33
LDI r2, 225
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
