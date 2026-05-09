; DESCRIPTION: Composite: Places a cyan dot at position (217, 100) then Renders a red box of size 109x48 starting at (49, 71).
; PLAN: r0=217(x), r1=100(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=49(x), r6=71(y), r7=109(width), r8=48(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 100
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 49
LDI r6, 71
LDI r7, 109
LDI r8, 48
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
