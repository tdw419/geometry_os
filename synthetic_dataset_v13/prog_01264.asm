; DESCRIPTION: Draws a green line from (148, 29) to (398, 193).
; PLAN: r0=148(x1), r1=29(y1), r2=398(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 29
LDI r2, 398
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
