; DESCRIPTION: Renders a white line between points (150, 141) and (294, 47).
; PLAN: r0=150(x1), r1=141(y1), r2=294(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 141
LDI r2, 294
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
