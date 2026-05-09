; DESCRIPTION: Draws a white line from (187, 194) to (154, 96).
; PLAN: r0=187(x1), r1=194(y1), r2=154(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 194
LDI r2, 154
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
