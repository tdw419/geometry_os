; DESCRIPTION: Composite: Places a white dot at position (419, 103) then Renders a orange box of size 92x27 starting at (283, 118).
; PLAN: r0=419(x), r1=103(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=283(x), r6=118(y), r7=92(width), r8=27(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 103
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 283
LDI r6, 118
LDI r7, 92
LDI r8, 27
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
