; DESCRIPTION: Draws a white line from (300, 42) to (152, 220).
; PLAN: r0=300(x1), r1=42(y1), r2=152(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 42
LDI r2, 152
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
