; DESCRIPTION: Places a white line segment connecting (107, 246) to (214, 146).
; PLAN: r0=107(x1), r1=246(y1), r2=214(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 246
LDI r2, 214
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
