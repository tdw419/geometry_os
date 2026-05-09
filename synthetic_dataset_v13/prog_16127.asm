; DESCRIPTION: Draws a green line from (20, 228) to (420, 40).
; PLAN: r0=20(x1), r1=228(y1), r2=420(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 228
LDI r2, 420
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
