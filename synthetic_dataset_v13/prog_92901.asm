; DESCRIPTION: Renders a black line between points (406, 197) and (386, 5).
; PLAN: r0=406(x1), r1=197(y1), r2=386(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 197
LDI r2, 386
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
