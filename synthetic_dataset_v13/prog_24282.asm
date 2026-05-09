; DESCRIPTION: Renders a red disk with center (305, 143) and radius 60.
; PLAN: r0=305(x), r1=143(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 143
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
