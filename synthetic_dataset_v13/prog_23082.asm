; DESCRIPTION: Draws a cyan line from (56, 204) to (224, 188).
; PLAN: r0=56(x1), r1=204(y1), r2=224(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 204
LDI r2, 224
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
