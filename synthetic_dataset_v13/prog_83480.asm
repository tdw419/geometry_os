; DESCRIPTION: Renders a cyan line between points (94, 208) and (492, 108).
; PLAN: r0=94(x1), r1=208(y1), r2=492(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 208
LDI r2, 492
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
