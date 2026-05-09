; DESCRIPTION: Renders a magenta line between points (401, 166) and (428, 229).
; PLAN: r0=401(x1), r1=166(y1), r2=428(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 166
LDI r2, 428
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
