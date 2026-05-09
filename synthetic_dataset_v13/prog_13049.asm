; DESCRIPTION: Places a cyan line segment connecting (76, 236) to (224, 27).
; PLAN: r0=76(x1), r1=236(y1), r2=224(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 236
LDI r2, 224
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
