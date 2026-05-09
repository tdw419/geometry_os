; DESCRIPTION: Places a white line segment connecting (275, 216) to (346, 195).
; PLAN: r0=275(x1), r1=216(y1), r2=346(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 216
LDI r2, 346
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
