; DESCRIPTION: Draws a cyan line from (224, 13) to (183, 206).
; PLAN: r0=224(x1), r1=13(y1), r2=183(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 13
LDI r2, 183
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
