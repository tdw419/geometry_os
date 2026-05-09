; DESCRIPTION: Composite: Sets a single yellow pixel at (415, 41) then Renders a yellow box of size 90x91 starting at (413, 157).
; PLAN: r0=415(x), r1=41(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=157(y), r7=90(width), r8=91(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 41
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 413
LDI r6, 157
LDI r7, 90
LDI r8, 91
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
