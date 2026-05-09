; DESCRIPTION: Renders a cyan line between points (23, 253) and (254, 232).
; PLAN: r0=23(x1), r1=253(y1), r2=254(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 253
LDI r2, 254
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
