; DESCRIPTION: Places a red line segment connecting (401, 21) to (298, 197).
; PLAN: r0=401(x1), r1=21(y1), r2=298(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 21
LDI r2, 298
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
