; DESCRIPTION: Renders a green line between points (469, 69) and (450, 95).
; PLAN: r0=469(x1), r1=69(y1), r2=450(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 69
LDI r2, 450
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
