; DESCRIPTION: Renders a red disk with center (410, 202) and radius 19.
; PLAN: r0=410(x), r1=202(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 202
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
