; DESCRIPTION: Renders a red line between points (70, 149) and (215, 50).
; PLAN: r0=70(x1), r1=149(y1), r2=215(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 149
LDI r2, 215
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
