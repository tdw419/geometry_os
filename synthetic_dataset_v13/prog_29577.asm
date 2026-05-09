; DESCRIPTION: Renders a cyan line between points (371, 79) and (224, 246).
; PLAN: r0=371(x1), r1=79(y1), r2=224(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 79
LDI r2, 224
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
