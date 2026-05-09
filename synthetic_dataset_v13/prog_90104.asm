; DESCRIPTION: Renders a green line between points (59, 216) and (497, 242).
; PLAN: r0=59(x1), r1=216(y1), r2=497(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 216
LDI r2, 497
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
