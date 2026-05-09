; DESCRIPTION: Draws a cyan line from (386, 53) to (287, 175).
; PLAN: r0=386(x1), r1=53(y1), r2=287(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 53
LDI r2, 287
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
