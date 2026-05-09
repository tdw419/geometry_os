; DESCRIPTION: Draws a cyan line from (499, 246) to (143, 163).
; PLAN: r0=499(x1), r1=246(y1), r2=143(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 246
LDI r2, 143
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
