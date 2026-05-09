; DESCRIPTION: Renders a black line between points (440, 43) and (502, 27).
; PLAN: r0=440(x1), r1=43(y1), r2=502(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 43
LDI r2, 502
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
