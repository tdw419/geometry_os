; DESCRIPTION: Renders a red line between points (161, 93) and (284, 8).
; PLAN: r0=161(x1), r1=93(y1), r2=284(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 93
LDI r2, 284
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
