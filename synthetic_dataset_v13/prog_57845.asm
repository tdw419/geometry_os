; DESCRIPTION: Places a white line segment connecting (497, 45) to (284, 221).
; PLAN: r0=497(x1), r1=45(y1), r2=284(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 45
LDI r2, 284
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
