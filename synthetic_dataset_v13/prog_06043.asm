; DESCRIPTION: Renders a black line between points (468, 173) and (386, 149).
; PLAN: r0=468(x1), r1=173(y1), r2=386(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 173
LDI r2, 386
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
