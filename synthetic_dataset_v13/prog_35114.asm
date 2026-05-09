; DESCRIPTION: Renders a cyan line between points (347, 83) and (288, 242).
; PLAN: r0=347(x1), r1=83(y1), r2=288(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 83
LDI r2, 288
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
