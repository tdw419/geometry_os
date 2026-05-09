; DESCRIPTION: Draws a cyan line from (285, 91) to (336, 50).
; PLAN: r0=285(x1), r1=91(y1), r2=336(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 91
LDI r2, 336
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
