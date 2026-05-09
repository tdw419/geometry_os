; DESCRIPTION: Places a cyan line segment connecting (400, 232) to (291, 174).
; PLAN: r0=400(x1), r1=232(y1), r2=291(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 232
LDI r2, 291
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
