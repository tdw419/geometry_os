; DESCRIPTION: Draws a cyan line from (232, 243) to (189, 224).
; PLAN: r0=232(x1), r1=243(y1), r2=189(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 243
LDI r2, 189
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
