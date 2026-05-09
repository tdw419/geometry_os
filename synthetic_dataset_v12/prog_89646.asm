; DESCRIPTION: Places a cyan line segment connecting (349, 197) to (232, 246).
; PLAN: r0=349(x1), r1=197(y1), r2=232(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 197
LDI r2, 232
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
