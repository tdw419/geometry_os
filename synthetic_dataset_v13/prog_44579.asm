; DESCRIPTION: Renders a cyan line between points (193, 16) and (126, 35).
; PLAN: r0=193(x1), r1=16(y1), r2=126(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 16
LDI r2, 126
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
