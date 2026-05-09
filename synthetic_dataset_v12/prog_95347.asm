; DESCRIPTION: Renders a red line between points (415, 174) and (320, 210).
; PLAN: r0=415(x1), r1=174(y1), r2=320(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 174
LDI r2, 320
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
