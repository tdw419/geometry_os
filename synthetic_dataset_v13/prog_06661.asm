; DESCRIPTION: Draws a cyan line from (301, 209) to (96, 222).
; PLAN: r0=301(x1), r1=209(y1), r2=96(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 209
LDI r2, 96
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
