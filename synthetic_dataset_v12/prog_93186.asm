; DESCRIPTION: Renders a cyan line between points (209, 58) and (492, 137).
; PLAN: r0=209(x1), r1=58(y1), r2=492(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 58
LDI r2, 492
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
