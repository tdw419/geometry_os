; DESCRIPTION: Draws a cyan line from (231, 236) to (214, 224).
; PLAN: r0=231(x1), r1=236(y1), r2=214(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 236
LDI r2, 214
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
