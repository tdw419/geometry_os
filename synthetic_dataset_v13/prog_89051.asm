; DESCRIPTION: Draws a white line from (66, 76) to (175, 27).
; PLAN: r0=66(x1), r1=76(y1), r2=175(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 76
LDI r2, 175
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
