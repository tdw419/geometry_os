; DESCRIPTION: Renders a cyan line between points (76, 50) and (218, 160).
; PLAN: r0=76(x1), r1=50(y1), r2=218(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 50
LDI r2, 218
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
