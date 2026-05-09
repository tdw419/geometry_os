; DESCRIPTION: Places a white line segment connecting (346, 71) to (492, 253).
; PLAN: r0=346(x1), r1=71(y1), r2=492(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 71
LDI r2, 492
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
