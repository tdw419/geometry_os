; DESCRIPTION: Draws a cyan line from (135, 14) to (224, 129).
; PLAN: r0=135(x1), r1=14(y1), r2=224(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 14
LDI r2, 224
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
