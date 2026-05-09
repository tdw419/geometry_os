; DESCRIPTION: Places a cyan line segment connecting (433, 142) to (21, 69).
; PLAN: r0=433(x1), r1=142(y1), r2=21(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 142
LDI r2, 21
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
