; DESCRIPTION: Draws a cyan line from (38, 27) to (18, 227).
; PLAN: r0=38(x1), r1=27(y1), r2=18(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 27
LDI r2, 18
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
