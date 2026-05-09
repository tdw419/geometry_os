; DESCRIPTION: Draws a white line from (300, 242) to (224, 229).
; PLAN: r0=300(x1), r1=242(y1), r2=224(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 242
LDI r2, 224
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
