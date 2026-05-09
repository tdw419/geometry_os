; DESCRIPTION: Places a cyan line segment connecting (387, 126) to (148, 38).
; PLAN: r0=387(x1), r1=126(y1), r2=148(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 126
LDI r2, 148
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
