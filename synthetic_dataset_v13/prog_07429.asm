; DESCRIPTION: Composite: Places a green dot at position (481, 247) then Renders a black box of size 75x17 starting at (235, 46).
; PLAN: r0=481(x), r1=247(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=46(y), r7=75(width), r8=17(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 481
LDI r1, 247
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 235
LDI r6, 46
LDI r7, 75
LDI r8, 17
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
