; DESCRIPTION: Composite: Places a orange dot at position (502, 224) then Places a cyan circle of radius 73 at center (212, 174).
; PLAN: r0=502(x), r1=224(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=212(x), r6=174(y), r7=73(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 502
LDI r1, 224
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 212
LDI r6, 174
LDI r7, 73
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
