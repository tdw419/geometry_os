; DESCRIPTION: Places a red line segment connecting (201, 173) to (446, 164).
; PLAN: r0=201(x1), r1=173(y1), r2=446(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 173
LDI r2, 446
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
