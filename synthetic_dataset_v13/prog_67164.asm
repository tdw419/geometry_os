; DESCRIPTION: Renders a green line between points (239, 90) and (434, 135).
; PLAN: r0=239(x1), r1=90(y1), r2=434(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 90
LDI r2, 434
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
