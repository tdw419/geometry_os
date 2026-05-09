; DESCRIPTION: Draws a green line from (389, 130) to (305, 93).
; PLAN: r0=389(x1), r1=130(y1), r2=305(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 130
LDI r2, 305
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
