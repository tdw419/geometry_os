; DESCRIPTION: Renders a red line between points (224, 12) and (154, 83).
; PLAN: r0=224(x1), r1=12(y1), r2=154(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 12
LDI r2, 154
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
