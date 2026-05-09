; DESCRIPTION: Renders a cyan line between points (271, 128) and (301, 55).
; PLAN: r0=271(x1), r1=128(y1), r2=301(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 128
LDI r2, 301
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
