; DESCRIPTION: Renders a cyan line between points (363, 255) and (214, 22).
; PLAN: r0=363(x1), r1=255(y1), r2=214(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 255
LDI r2, 214
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
