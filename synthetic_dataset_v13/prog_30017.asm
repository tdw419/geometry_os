; DESCRIPTION: Renders a blue line between points (144, 154) and (433, 166).
; PLAN: r0=144(x1), r1=154(y1), r2=433(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 154
LDI r2, 433
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
