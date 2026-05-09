; DESCRIPTION: Renders a magenta line between points (405, 94) and (275, 236).
; PLAN: r0=405(x1), r1=94(y1), r2=275(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 94
LDI r2, 275
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
