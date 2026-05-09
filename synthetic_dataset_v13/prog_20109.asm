; DESCRIPTION: Places a white line segment connecting (275, 221) to (128, 40).
; PLAN: r0=275(x1), r1=221(y1), r2=128(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 221
LDI r2, 128
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
