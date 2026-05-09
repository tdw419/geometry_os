; DESCRIPTION: Renders a black line between points (499, 172) and (239, 139).
; PLAN: r0=499(x1), r1=172(y1), r2=239(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 172
LDI r2, 239
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
