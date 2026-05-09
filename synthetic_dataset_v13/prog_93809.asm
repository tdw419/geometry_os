; DESCRIPTION: Composite: Places a white dot at position (65, 137) then Places a green 36x111 rectangle at position (399, 142).
; PLAN: r0=65(x), r1=137(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=399(x), r6=142(y), r7=36(width), r8=111(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 137
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 399
LDI r6, 142
LDI r7, 36
LDI r8, 111
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
