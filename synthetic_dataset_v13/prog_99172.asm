; DESCRIPTION: Composite: Places a white dot at position (452, 28) then Renders a red box of size 47x104 starting at (152, 10).
; PLAN: r0=452(x), r1=28(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=152(x), r6=10(y), r7=47(width), r8=104(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 452
LDI r1, 28
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 152
LDI r6, 10
LDI r7, 47
LDI r8, 104
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
