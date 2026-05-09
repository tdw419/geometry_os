; DESCRIPTION: Renders a cyan line between points (128, 156) and (305, 224).
; PLAN: r0=128(x1), r1=156(y1), r2=305(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 156
LDI r2, 305
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
