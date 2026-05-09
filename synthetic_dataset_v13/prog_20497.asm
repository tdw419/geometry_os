; DESCRIPTION: Places a cyan line segment connecting (131, 223) to (401, 10).
; PLAN: r0=131(x1), r1=223(y1), r2=401(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 223
LDI r2, 401
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
