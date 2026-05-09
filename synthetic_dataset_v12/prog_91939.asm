; DESCRIPTION: Composite: Places a white dot at position (421, 154) then Renders a red box of size 15x84 starting at (32, 72).
; PLAN: r0=421(x), r1=154(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=32(x), r6=72(y), r7=15(width), r8=84(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 154
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 32
LDI r6, 72
LDI r7, 15
LDI r8, 84
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
