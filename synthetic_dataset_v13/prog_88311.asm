; DESCRIPTION: Places a magenta line segment connecting (502, 132) to (443, 197).
; PLAN: r0=502(x1), r1=132(y1), r2=443(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 132
LDI r2, 443
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
