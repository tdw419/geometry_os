; DESCRIPTION: Draws a cyan line from (108, 82) to (456, 189).
; PLAN: r0=108(x1), r1=82(y1), r2=456(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 82
LDI r2, 456
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
