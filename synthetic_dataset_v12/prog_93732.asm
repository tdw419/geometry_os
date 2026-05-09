; DESCRIPTION: Draws a white line from (265, 44) to (39, 209).
; PLAN: r0=265(x1), r1=44(y1), r2=39(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 44
LDI r2, 39
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
