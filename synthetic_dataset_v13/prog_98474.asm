; DESCRIPTION: Draws a cyan line from (224, 132) to (245, 161).
; PLAN: r0=224(x1), r1=132(y1), r2=245(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 132
LDI r2, 245
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
