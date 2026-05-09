; DESCRIPTION: Places a black line segment connecting (171, 71) to (400, 215).
; PLAN: r0=171(x1), r1=71(y1), r2=400(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 71
LDI r2, 400
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
