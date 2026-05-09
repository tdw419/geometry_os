; DESCRIPTION: Draws a cyan line from (421, 220) to (272, 15).
; PLAN: r0=421(x1), r1=220(y1), r2=272(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 220
LDI r2, 272
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
