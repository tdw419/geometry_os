; DESCRIPTION: Renders a cyan line between points (240, 116) and (103, 189).
; PLAN: r0=240(x1), r1=116(y1), r2=103(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 116
LDI r2, 103
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
