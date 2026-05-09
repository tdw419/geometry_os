; DESCRIPTION: Composite: Renders a cyan disk with center (334, 141) and radius 61 then Places a white dot at position (482, 169).
; PLAN: r0=334(x), r1=141(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=482(x), r6=169(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 334
LDI r1, 141
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 482
LDI r6, 169
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
