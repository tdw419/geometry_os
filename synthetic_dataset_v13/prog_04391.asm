; DESCRIPTION: Draws a white line from (386, 196) to (131, 34).
; PLAN: r0=386(x1), r1=196(y1), r2=131(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 196
LDI r2, 131
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
