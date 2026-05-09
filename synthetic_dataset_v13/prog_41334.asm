; DESCRIPTION: Renders a cyan line between points (311, 32) and (404, 182).
; PLAN: r0=311(x1), r1=32(y1), r2=404(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 32
LDI r2, 404
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
