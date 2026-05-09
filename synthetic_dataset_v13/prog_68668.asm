; DESCRIPTION: Composite: Places a green dot at position (290, 120) then Draws a blue rectangle at (97, 36) with width 65 and height 35.
; PLAN: r0=290(x), r1=120(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=97(x), r6=36(y), r7=65(width), r8=35(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 290
LDI r1, 120
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 97
LDI r6, 36
LDI r7, 65
LDI r8, 35
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
