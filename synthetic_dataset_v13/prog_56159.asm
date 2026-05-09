; DESCRIPTION: Places a green line segment connecting (387, 210) to (510, 206).
; PLAN: r0=387(x1), r1=210(y1), r2=510(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 210
LDI r2, 510
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
