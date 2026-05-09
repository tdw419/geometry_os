; DESCRIPTION: Draws a green line from (386, 7) to (81, 1).
; PLAN: r0=386(x1), r1=7(y1), r2=81(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 7
LDI r2, 81
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
