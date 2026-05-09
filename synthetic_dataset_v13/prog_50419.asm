; DESCRIPTION: Draws a green line from (398, 166) to (75, 150).
; PLAN: r0=398(x1), r1=166(y1), r2=75(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 166
LDI r2, 75
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
