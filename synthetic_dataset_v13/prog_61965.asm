; DESCRIPTION: Renders a cyan line between points (281, 81) and (178, 241).
; PLAN: r0=281(x1), r1=81(y1), r2=178(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 81
LDI r2, 178
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
