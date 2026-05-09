; DESCRIPTION: Composite: Creates a cyan circular shape at (392, 21) with radius 16 then Places a yellow dot at position (292, 107).
; PLAN: r0=392(x), r1=21(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=107(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 392
LDI r1, 21
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 107
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
