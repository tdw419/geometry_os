; DESCRIPTION: Places a white line segment connecting (362, 226) to (470, 215).
; PLAN: r0=362(x1), r1=226(y1), r2=470(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 226
LDI r2, 470
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
