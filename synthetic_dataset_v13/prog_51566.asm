; DESCRIPTION: Composite: Places a yellow dot at position (416, 161) then Creates a red circular shape at (320, 108) with radius 65.
; PLAN: r0=416(x), r1=161(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=108(y), r7=65(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 416
LDI r1, 161
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 320
LDI r6, 108
LDI r7, 65
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
