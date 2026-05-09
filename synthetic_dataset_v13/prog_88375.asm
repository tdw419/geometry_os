; DESCRIPTION: Composite: Places a white dot at position (503, 226) then Renders a white box of size 102x76 starting at (211, 5).
; PLAN: r0=503(x), r1=226(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=5(y), r7=102(width), r8=76(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 503
LDI r1, 226
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 5
LDI r7, 102
LDI r8, 76
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
