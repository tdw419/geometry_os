; DESCRIPTION: Draws a cyan line from (111, 108) to (143, 175).
; PLAN: r0=111(x1), r1=108(y1), r2=143(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 108
LDI r2, 143
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
