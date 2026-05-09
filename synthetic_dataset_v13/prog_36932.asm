; DESCRIPTION: Renders a green line between points (404, 188) and (298, 108).
; PLAN: r0=404(x1), r1=188(y1), r2=298(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 188
LDI r2, 298
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
