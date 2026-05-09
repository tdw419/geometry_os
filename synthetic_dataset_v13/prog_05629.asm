; DESCRIPTION: Places a red line segment connecting (224, 223) to (284, 66).
; PLAN: r0=224(x1), r1=223(y1), r2=284(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 223
LDI r2, 284
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
