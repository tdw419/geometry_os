; DESCRIPTION: Renders a yellow line between points (260, 242) and (434, 173).
; PLAN: r0=260(x1), r1=242(y1), r2=434(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 242
LDI r2, 434
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
