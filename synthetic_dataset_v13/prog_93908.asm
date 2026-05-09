; DESCRIPTION: Renders a red line between points (239, 67) and (25, 164).
; PLAN: r0=239(x1), r1=67(y1), r2=25(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 67
LDI r2, 25
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
