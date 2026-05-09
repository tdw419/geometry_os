; DESCRIPTION: Draws a cyan line from (439, 114) to (338, 134).
; PLAN: r0=439(x1), r1=114(y1), r2=338(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 114
LDI r2, 338
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
