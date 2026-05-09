; DESCRIPTION: Composite: Places a green circle of radius 32 at center (416, 115) then Places a yellow dot at position (72, 255).
; PLAN: r0=416(x), r1=115(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=72(x), r6=255(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 416
LDI r1, 115
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 72
LDI r6, 255
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
