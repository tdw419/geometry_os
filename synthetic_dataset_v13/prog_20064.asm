; DESCRIPTION: Draws a white line from (88, 191) to (346, 164).
; PLAN: r0=88(x1), r1=191(y1), r2=346(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 191
LDI r2, 346
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
