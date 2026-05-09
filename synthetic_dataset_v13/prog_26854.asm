; DESCRIPTION: Places a white line segment connecting (103, 186) to (316, 42).
; PLAN: r0=103(x1), r1=186(y1), r2=316(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 186
LDI r2, 316
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
