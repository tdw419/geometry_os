; DESCRIPTION: Renders a green line between points (299, 12) and (391, 255).
; PLAN: r0=299(x1), r1=12(y1), r2=391(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 12
LDI r2, 391
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
