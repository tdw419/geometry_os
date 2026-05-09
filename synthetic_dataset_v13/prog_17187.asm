; DESCRIPTION: Renders a white line between points (379, 239) and (260, 222).
; PLAN: r0=379(x1), r1=239(y1), r2=260(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 239
LDI r2, 260
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
