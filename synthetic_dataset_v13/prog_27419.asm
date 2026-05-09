; DESCRIPTION: Draws a white line from (307, 20) to (154, 246).
; PLAN: r0=307(x1), r1=20(y1), r2=154(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 20
LDI r2, 154
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
