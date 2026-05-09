; DESCRIPTION: Draws a cyan line from (4, 84) to (263, 82).
; PLAN: r0=4(x1), r1=84(y1), r2=263(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 84
LDI r2, 263
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
