; DESCRIPTION: Draws a green line from (224, 69) to (209, 31).
; PLAN: r0=224(x1), r1=69(y1), r2=209(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 69
LDI r2, 209
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
