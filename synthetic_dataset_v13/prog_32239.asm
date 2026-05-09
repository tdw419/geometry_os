; DESCRIPTION: Draws a magenta line from (308, 24) to (415, 213).
; PLAN: r0=308(x1), r1=24(y1), r2=415(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 24
LDI r2, 415
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
