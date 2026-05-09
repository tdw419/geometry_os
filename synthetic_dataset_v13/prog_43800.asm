; DESCRIPTION: Composite: Places a green dot at position (324, 242) then Draws a white rectangle at (149, 5) with width 48 and height 117.
; PLAN: r0=324(x), r1=242(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=149(x), r6=5(y), r7=48(width), r8=117(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 242
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 149
LDI r6, 5
LDI r7, 48
LDI r8, 117
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
