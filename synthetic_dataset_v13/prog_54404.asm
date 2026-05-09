; DESCRIPTION: Renders a black line between points (151, 204) and (394, 113).
; PLAN: r0=151(x1), r1=204(y1), r2=394(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 204
LDI r2, 394
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
