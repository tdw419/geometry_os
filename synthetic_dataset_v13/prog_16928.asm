; DESCRIPTION: Renders a red line between points (16, 225) and (53, 166).
; PLAN: r0=16(x1), r1=225(y1), r2=53(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 225
LDI r2, 53
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
