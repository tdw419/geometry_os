; DESCRIPTION: Places a cyan line segment connecting (285, 41) to (294, 152).
; PLAN: r0=285(x1), r1=41(y1), r2=294(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 41
LDI r2, 294
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
