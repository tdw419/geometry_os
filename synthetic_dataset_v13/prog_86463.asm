; DESCRIPTION: Places a white line segment connecting (511, 228) to (224, 203).
; PLAN: r0=511(x1), r1=228(y1), r2=224(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 228
LDI r2, 224
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
