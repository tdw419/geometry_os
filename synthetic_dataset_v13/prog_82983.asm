; DESCRIPTION: Renders a blue line between points (410, 210) and (206, 208).
; PLAN: r0=410(x1), r1=210(y1), r2=206(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 210
LDI r2, 206
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
