; DESCRIPTION: Places a cyan line segment connecting (141, 223) to (210, 236).
; PLAN: r0=141(x1), r1=223(y1), r2=210(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 223
LDI r2, 210
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
