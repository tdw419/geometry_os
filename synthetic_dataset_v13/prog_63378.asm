; DESCRIPTION: Renders a magenta line between points (401, 220) and (439, 94).
; PLAN: r0=401(x1), r1=220(y1), r2=439(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 220
LDI r2, 439
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
