; DESCRIPTION: Composite: Places a magenta dot at position (325, 93) then Draws a green rectangle at (256, 47) with width 91 and height 32.
; PLAN: r0=325(x), r1=93(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=47(y), r7=91(width), r8=32(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 93
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 256
LDI r6, 47
LDI r7, 91
LDI r8, 32
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
