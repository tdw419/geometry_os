; DESCRIPTION: Composite: Places a orange dot at position (394, 140) then Renders a blue box of size 34x26 starting at (92, 89).
; PLAN: r0=394(x), r1=140(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=92(x), r6=89(y), r7=34(width), r8=26(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 140
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 92
LDI r6, 89
LDI r7, 34
LDI r8, 26
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
