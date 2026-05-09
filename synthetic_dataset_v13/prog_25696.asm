; DESCRIPTION: Draws a cyan line from (332, 78) to (224, 170).
; PLAN: r0=332(x1), r1=78(y1), r2=224(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 78
LDI r2, 224
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
