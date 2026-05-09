; DESCRIPTION: Draws a cyan line from (402, 72) to (340, 99).
; PLAN: r0=402(x1), r1=72(y1), r2=340(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 72
LDI r2, 340
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
