; DESCRIPTION: Renders a red line between points (310, 148) and (239, 68).
; PLAN: r0=310(x1), r1=148(y1), r2=239(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 148
LDI r2, 239
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
