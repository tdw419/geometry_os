; DESCRIPTION: Composite: Places a red dot at position (30, 69) then Renders a white box of size 41x92 starting at (130, 135).
; PLAN: r0=30(x), r1=69(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=135(y), r7=41(width), r8=92(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 69
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 130
LDI r6, 135
LDI r7, 41
LDI r8, 92
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
