; DESCRIPTION: Composite: Places a blue dot at position (160, 103) then Renders a green box of size 113x83 starting at (374, 28).
; PLAN: r0=160(x), r1=103(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=28(y), r7=113(width), r8=83(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 103
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 374
LDI r6, 28
LDI r7, 113
LDI r8, 83
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
