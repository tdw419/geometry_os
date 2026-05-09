; DESCRIPTION: Renders a magenta line between points (487, 47) and (320, 246).
; PLAN: r0=487(x1), r1=47(y1), r2=320(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 47
LDI r2, 320
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
