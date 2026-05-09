; DESCRIPTION: Draws a cyan line from (71, 160) to (380, 38).
; PLAN: r0=71(x1), r1=160(y1), r2=380(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 160
LDI r2, 380
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
