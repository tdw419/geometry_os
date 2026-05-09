; DESCRIPTION: Renders a red line between points (9, 162) and (480, 42).
; PLAN: r0=9(x1), r1=162(y1), r2=480(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 162
LDI r2, 480
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
