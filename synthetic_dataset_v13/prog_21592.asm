; DESCRIPTION: Renders a cyan line between points (16, 241) and (416, 176).
; PLAN: r0=16(x1), r1=241(y1), r2=416(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 241
LDI r2, 416
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
