; DESCRIPTION: Renders a red line between points (182, 39) and (224, 29).
; PLAN: r0=182(x1), r1=39(y1), r2=224(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 39
LDI r2, 224
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
