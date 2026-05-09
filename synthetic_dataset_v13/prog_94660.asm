; DESCRIPTION: Composite: Renders a orange box of size 91x113 starting at (235, 105) then Sets a single orange pixel at (475, 207).
; PLAN: r0=235(x), r1=105(y), r2=91(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=475(x), r6=207(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 235
LDI r1, 105
LDI r2, 91
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 207
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
