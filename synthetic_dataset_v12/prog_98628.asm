; DESCRIPTION: Renders a yellow line between points (225, 87) and (294, 108).
; PLAN: r0=225(x1), r1=87(y1), r2=294(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 87
LDI r2, 294
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
