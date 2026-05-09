; DESCRIPTION: Renders a red line between points (154, 161) and (42, 55).
; PLAN: r0=154(x1), r1=161(y1), r2=42(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 161
LDI r2, 42
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
