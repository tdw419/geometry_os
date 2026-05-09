; DESCRIPTION: Draws a black line from (255, 16) to (443, 13).
; PLAN: r0=255(x1), r1=16(y1), r2=443(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 16
LDI r2, 443
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
