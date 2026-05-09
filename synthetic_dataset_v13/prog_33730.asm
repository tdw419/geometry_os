; DESCRIPTION: Draws a magenta line from (346, 44) to (275, 220).
; PLAN: r0=346(x1), r1=44(y1), r2=275(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 44
LDI r2, 275
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
