; DESCRIPTION: Renders a red line between points (5, 215) and (350, 239).
; PLAN: r0=5(x1), r1=215(y1), r2=350(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 215
LDI r2, 350
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
