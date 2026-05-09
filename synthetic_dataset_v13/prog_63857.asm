; DESCRIPTION: Renders a cyan line between points (243, 255) and (87, 220).
; PLAN: r0=243(x1), r1=255(y1), r2=87(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 255
LDI r2, 87
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
