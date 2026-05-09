; DESCRIPTION: Composite: Places a cyan dot at position (425, 11) then Renders a green box of size 120x120 starting at (235, 58).
; PLAN: r0=425(x), r1=11(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=58(y), r7=120(width), r8=120(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 11
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 235
LDI r6, 58
LDI r7, 120
LDI r8, 120
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
