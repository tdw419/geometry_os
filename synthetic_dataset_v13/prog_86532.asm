; DESCRIPTION: Draws a cyan line from (386, 212) to (40, 70).
; PLAN: r0=386(x1), r1=212(y1), r2=40(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 212
LDI r2, 40
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
