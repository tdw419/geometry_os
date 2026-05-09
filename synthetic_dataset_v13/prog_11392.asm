; DESCRIPTION: Draws a black line from (287, 208) to (386, 107).
; PLAN: r0=287(x1), r1=208(y1), r2=386(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 208
LDI r2, 386
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
