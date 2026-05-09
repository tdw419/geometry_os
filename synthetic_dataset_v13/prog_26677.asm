; DESCRIPTION: Places a magenta line segment connecting (440, 103) to (217, 107).
; PLAN: r0=440(x1), r1=103(y1), r2=217(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 103
LDI r2, 217
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
