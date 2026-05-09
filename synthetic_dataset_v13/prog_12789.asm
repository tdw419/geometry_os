; DESCRIPTION: Renders a magenta line between points (140, 143) and (479, 250).
; PLAN: r0=140(x1), r1=143(y1), r2=479(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 143
LDI r2, 479
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
