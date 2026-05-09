; DESCRIPTION: Draws a magenta line from (124, 180) to (21, 213).
; PLAN: r0=124(x1), r1=180(y1), r2=21(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 180
LDI r2, 21
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
