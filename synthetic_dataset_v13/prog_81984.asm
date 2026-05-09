; DESCRIPTION: Draws a magenta line from (400, 142) to (239, 117).
; PLAN: r0=400(x1), r1=142(y1), r2=239(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 142
LDI r2, 239
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
