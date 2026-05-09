; DESCRIPTION: Renders a magenta line between points (410, 1) and (115, 236).
; PLAN: r0=410(x1), r1=1(y1), r2=115(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 1
LDI r2, 115
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
