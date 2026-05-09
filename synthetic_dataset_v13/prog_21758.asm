; DESCRIPTION: Renders a red line between points (240, 228) and (206, 222).
; PLAN: r0=240(x1), r1=228(y1), r2=206(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 228
LDI r2, 206
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
