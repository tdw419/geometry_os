; DESCRIPTION: Renders a cyan line between points (255, 44) and (308, 76).
; PLAN: r0=255(x1), r1=44(y1), r2=308(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 44
LDI r2, 308
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
