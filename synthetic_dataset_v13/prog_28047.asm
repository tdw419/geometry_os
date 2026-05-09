; DESCRIPTION: Draws a cyan line from (138, 108) to (29, 165).
; PLAN: r0=138(x1), r1=108(y1), r2=29(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 108
LDI r2, 29
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
