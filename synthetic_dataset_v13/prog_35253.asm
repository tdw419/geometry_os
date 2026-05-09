; DESCRIPTION: Draws a red line from (154, 244) to (87, 124).
; PLAN: r0=154(x1), r1=244(y1), r2=87(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 244
LDI r2, 87
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
