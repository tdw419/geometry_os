; DESCRIPTION: Renders a white line between points (222, 55) and (171, 111).
; PLAN: r0=222(x1), r1=55(y1), r2=171(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 55
LDI r2, 171
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
