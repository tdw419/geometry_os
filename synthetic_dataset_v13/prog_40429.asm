; DESCRIPTION: Places a red line segment connecting (326, 164) to (174, 215).
; PLAN: r0=326(x1), r1=164(y1), r2=174(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 164
LDI r2, 174
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
