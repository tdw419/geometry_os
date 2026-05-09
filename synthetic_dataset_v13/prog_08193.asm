; DESCRIPTION: Composite: Places a blue dot at position (291, 222) then Renders a white box of size 84x91 starting at (59, 119).
; PLAN: r0=291(x), r1=222(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=119(y), r7=84(width), r8=91(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 222
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 59
LDI r6, 119
LDI r7, 84
LDI r8, 91
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
