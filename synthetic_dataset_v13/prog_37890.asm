; DESCRIPTION: Draws a black line from (425, 29) to (13, 228).
; PLAN: r0=425(x1), r1=29(y1), r2=13(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 29
LDI r2, 13
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
