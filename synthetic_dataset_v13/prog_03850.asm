; DESCRIPTION: Draws a cyan line from (253, 23) to (440, 15).
; PLAN: r0=253(x1), r1=23(y1), r2=440(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 23
LDI r2, 440
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
