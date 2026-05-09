; DESCRIPTION: Draws a cyan line from (492, 41) to (59, 0).
; PLAN: r0=492(x1), r1=41(y1), r2=59(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 41
LDI r2, 59
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
