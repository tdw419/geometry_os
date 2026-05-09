; DESCRIPTION: Renders a yellow line between points (224, 82) and (11, 190).
; PLAN: r0=224(x1), r1=82(y1), r2=11(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 82
LDI r2, 11
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
