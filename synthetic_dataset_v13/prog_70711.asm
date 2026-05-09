; DESCRIPTION: Draws a white line from (27, 208) to (39, 173).
; PLAN: r0=27(x1), r1=208(y1), r2=39(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 208
LDI r2, 39
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
