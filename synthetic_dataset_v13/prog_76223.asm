; DESCRIPTION: Draws a white line from (122, 44) to (224, 187).
; PLAN: r0=122(x1), r1=44(y1), r2=224(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 44
LDI r2, 224
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
