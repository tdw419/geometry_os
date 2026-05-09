; DESCRIPTION: Draws a magenta line from (275, 233) to (502, 234).
; PLAN: r0=275(x1), r1=233(y1), r2=502(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 233
LDI r2, 502
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
