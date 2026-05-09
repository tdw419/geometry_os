; DESCRIPTION: Renders a red disk with center (360, 231) and radius 21.
; PLAN: r0=360(x), r1=231(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 231
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
