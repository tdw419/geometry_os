; DESCRIPTION: Renders a cyan line between points (215, 83) and (203, 143).
; PLAN: r0=215(x1), r1=83(y1), r2=203(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 83
LDI r2, 203
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
