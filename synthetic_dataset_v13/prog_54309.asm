; DESCRIPTION: Renders a cyan line between points (404, 48) and (135, 183).
; PLAN: r0=404(x1), r1=48(y1), r2=135(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 48
LDI r2, 135
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
