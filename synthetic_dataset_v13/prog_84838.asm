; DESCRIPTION: Places a white line segment connecting (43, 168) to (284, 238).
; PLAN: r0=43(x1), r1=168(y1), r2=284(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 168
LDI r2, 284
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
