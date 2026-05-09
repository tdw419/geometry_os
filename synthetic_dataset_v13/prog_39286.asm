; DESCRIPTION: Composite: Places a white dot at position (394, 217) then Renders a green box of size 55x21 starting at (375, 21).
; PLAN: r0=394(x), r1=217(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=375(x), r6=21(y), r7=55(width), r8=21(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 217
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 375
LDI r6, 21
LDI r7, 55
LDI r8, 21
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
