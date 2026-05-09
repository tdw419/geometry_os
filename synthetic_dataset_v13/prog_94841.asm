; DESCRIPTION: Renders a white line between points (497, 126) and (346, 249).
; PLAN: r0=497(x1), r1=126(y1), r2=346(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 126
LDI r2, 346
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
