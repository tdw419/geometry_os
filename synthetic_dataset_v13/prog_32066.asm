; DESCRIPTION: Renders a green line between points (173, 154) and (28, 95).
; PLAN: r0=173(x1), r1=154(y1), r2=28(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 154
LDI r2, 28
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
