; DESCRIPTION: Composite: Places a green dot at position (65, 171) then Renders a white box of size 95x84 starting at (249, 164).
; PLAN: r0=65(x), r1=171(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=164(y), r7=95(width), r8=84(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 171
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 249
LDI r6, 164
LDI r7, 95
LDI r8, 84
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
