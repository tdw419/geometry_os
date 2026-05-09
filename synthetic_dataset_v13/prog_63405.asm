; DESCRIPTION: Draws a green line from (20, 215) to (444, 113).
; PLAN: r0=20(x1), r1=215(y1), r2=444(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 215
LDI r2, 444
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
