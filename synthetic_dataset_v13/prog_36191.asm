; DESCRIPTION: Renders a magenta line between points (445, 11) and (174, 103).
; PLAN: r0=445(x1), r1=11(y1), r2=174(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 11
LDI r2, 174
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
