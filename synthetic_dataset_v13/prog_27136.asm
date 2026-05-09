; DESCRIPTION: Draws a cyan line from (255, 47) to (4, 93).
; PLAN: r0=255(x1), r1=47(y1), r2=4(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 47
LDI r2, 4
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
