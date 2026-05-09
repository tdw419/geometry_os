; DESCRIPTION: Composite: Places a red dot at position (227, 202) then Places a orange circle of radius 29 at center (416, 206).
; PLAN: r0=227(x), r1=202(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=416(x), r6=206(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 227
LDI r1, 202
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 416
LDI r6, 206
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
