; DESCRIPTION: Draws a blue line from (305, 129) to (460, 193).
; PLAN: r0=305(x1), r1=129(y1), r2=460(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 129
LDI r2, 460
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
