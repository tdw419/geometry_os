; DESCRIPTION: Renders a cyan line between points (442, 120) and (404, 84).
; PLAN: r0=442(x1), r1=120(y1), r2=404(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 120
LDI r2, 404
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
