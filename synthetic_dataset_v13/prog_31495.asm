; DESCRIPTION: Composite: Places a magenta dot at position (465, 148) then Places a white 104x111 rectangle at position (235, 108).
; PLAN: r0=465(x), r1=148(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=108(y), r7=104(width), r8=111(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 465
LDI r1, 148
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 235
LDI r6, 108
LDI r7, 104
LDI r8, 111
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
