; DESCRIPTION: Draws a cyan line from (442, 27) to (119, 187).
; PLAN: r0=442(x1), r1=27(y1), r2=119(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 27
LDI r2, 119
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
