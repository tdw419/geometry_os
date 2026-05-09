; DESCRIPTION: Renders a cyan line between points (0, 12) and (320, 212).
; PLAN: r0=0(x1), r1=12(y1), r2=320(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 12
LDI r2, 320
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
