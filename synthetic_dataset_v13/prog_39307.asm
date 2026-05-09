; DESCRIPTION: Places a white line segment connecting (215, 202) to (32, 127).
; PLAN: r0=215(x1), r1=202(y1), r2=32(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 202
LDI r2, 32
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
