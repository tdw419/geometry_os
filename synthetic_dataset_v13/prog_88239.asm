; DESCRIPTION: Draws a cyan line from (284, 232) to (452, 6).
; PLAN: r0=284(x1), r1=232(y1), r2=452(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 232
LDI r2, 452
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
