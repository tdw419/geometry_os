; DESCRIPTION: Renders a red line between points (281, 128) and (370, 254).
; PLAN: r0=281(x1), r1=128(y1), r2=370(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 128
LDI r2, 370
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
