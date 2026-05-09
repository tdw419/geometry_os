; DESCRIPTION: Composite: Places a green dot at position (27, 81) then Renders a magenta box of size 15x16 starting at (147, 6).
; PLAN: r0=27(x), r1=81(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=147(x), r6=6(y), r7=15(width), r8=16(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 27
LDI r1, 81
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 147
LDI r6, 6
LDI r7, 15
LDI r8, 16
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
