; DESCRIPTION: Draws a white line from (488, 68) to (398, 31).
; PLAN: r0=488(x1), r1=68(y1), r2=398(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 68
LDI r2, 398
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
