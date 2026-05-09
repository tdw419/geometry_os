; DESCRIPTION: Draws a cyan line from (444, 240) to (49, 255).
; PLAN: r0=444(x1), r1=240(y1), r2=49(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 240
LDI r2, 49
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
