; DESCRIPTION: Draws a black line from (187, 154) to (305, 100).
; PLAN: r0=187(x1), r1=154(y1), r2=305(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 154
LDI r2, 305
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
