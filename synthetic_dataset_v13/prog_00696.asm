; DESCRIPTION: Renders a green line between points (418, 164) and (480, 69).
; PLAN: r0=418(x1), r1=164(y1), r2=480(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 164
LDI r2, 480
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
