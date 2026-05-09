; DESCRIPTION: Draws a cyan line from (310, 220) to (332, 24).
; PLAN: r0=310(x1), r1=220(y1), r2=332(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 220
LDI r2, 332
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
