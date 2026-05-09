; DESCRIPTION: Composite: Creates a red circular shape at (416, 97) with radius 57 then Places a green dot at position (115, 50).
; PLAN: r0=416(x), r1=97(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x), r6=50(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 416
LDI r1, 97
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 50
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
