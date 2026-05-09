; DESCRIPTION: Renders a magenta line between points (445, 14) and (393, 215).
; PLAN: r0=445(x1), r1=14(y1), r2=393(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 14
LDI r2, 393
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
