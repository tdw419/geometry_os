; DESCRIPTION: Draws a cyan line from (224, 120) to (102, 37).
; PLAN: r0=224(x1), r1=120(y1), r2=102(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 120
LDI r2, 102
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
