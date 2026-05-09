; DESCRIPTION: Renders a cyan line between points (115, 161) and (173, 137).
; PLAN: r0=115(x1), r1=161(y1), r2=173(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 161
LDI r2, 173
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
