; DESCRIPTION: Renders a cyan line between points (270, 255) and (91, 204).
; PLAN: r0=270(x1), r1=255(y1), r2=91(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 255
LDI r2, 91
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
