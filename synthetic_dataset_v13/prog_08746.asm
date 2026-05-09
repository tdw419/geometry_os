; DESCRIPTION: Renders a green line between points (69, 215) and (328, 12).
; PLAN: r0=69(x1), r1=215(y1), r2=328(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 215
LDI r2, 328
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
