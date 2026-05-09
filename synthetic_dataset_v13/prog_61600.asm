; DESCRIPTION: Draws a red line from (386, 195) to (17, 95).
; PLAN: r0=386(x1), r1=195(y1), r2=17(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 195
LDI r2, 17
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
