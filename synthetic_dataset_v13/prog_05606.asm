; DESCRIPTION: Renders a white line between points (470, 151) and (350, 253).
; PLAN: r0=470(x1), r1=151(y1), r2=350(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 151
LDI r2, 350
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
