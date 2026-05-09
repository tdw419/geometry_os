; DESCRIPTION: Places a magenta line segment connecting (434, 126) to (117, 107).
; PLAN: r0=434(x1), r1=126(y1), r2=117(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 126
LDI r2, 117
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
