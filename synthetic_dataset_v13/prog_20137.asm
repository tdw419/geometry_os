; DESCRIPTION: Draws a cyan line from (108, 46) to (182, 47).
; PLAN: r0=108(x1), r1=46(y1), r2=182(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 46
LDI r2, 182
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
