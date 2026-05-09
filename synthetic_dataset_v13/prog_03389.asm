; DESCRIPTION: Renders a white line between points (496, 195) and (239, 178).
; PLAN: r0=496(x1), r1=195(y1), r2=239(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 195
LDI r2, 239
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
