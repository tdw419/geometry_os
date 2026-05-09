; DESCRIPTION: Draws a green line from (340, 113) to (225, 45).
; PLAN: r0=340(x1), r1=113(y1), r2=225(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 113
LDI r2, 225
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
