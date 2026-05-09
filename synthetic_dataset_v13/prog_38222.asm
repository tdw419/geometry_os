; DESCRIPTION: Renders a orange line between points (202, 254) and (398, 221).
; PLAN: r0=202(x1), r1=254(y1), r2=398(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 254
LDI r2, 398
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
