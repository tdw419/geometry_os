; DESCRIPTION: Draws a cyan line from (143, 180) to (208, 43).
; PLAN: r0=143(x1), r1=180(y1), r2=208(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 180
LDI r2, 208
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
