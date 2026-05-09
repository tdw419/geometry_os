; DESCRIPTION: Draws a cyan line from (416, 92) to (265, 52).
; PLAN: r0=416(x1), r1=92(y1), r2=265(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 92
LDI r2, 265
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
