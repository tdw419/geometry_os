; DESCRIPTION: Draws a cyan line from (49, 68) to (372, 184).
; PLAN: r0=49(x1), r1=68(y1), r2=372(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 68
LDI r2, 372
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
