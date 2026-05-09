; DESCRIPTION: Renders a black line between points (198, 10) and (174, 239).
; PLAN: r0=198(x1), r1=10(y1), r2=174(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 10
LDI r2, 174
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
