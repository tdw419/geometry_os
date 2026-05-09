; DESCRIPTION: Places a cyan line segment connecting (32, 223) to (305, 133).
; PLAN: r0=32(x1), r1=223(y1), r2=305(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 223
LDI r2, 305
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
