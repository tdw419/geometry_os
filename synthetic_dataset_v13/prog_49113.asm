; DESCRIPTION: Draws a cyan line from (122, 47) to (442, 26).
; PLAN: r0=122(x1), r1=47(y1), r2=442(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 47
LDI r2, 442
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
