; DESCRIPTION: Composite: Places a yellow dot at position (63, 215) then Renders a magenta box of size 37x118 starting at (116, 65).
; PLAN: r0=63(x), r1=215(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=116(x), r6=65(y), r7=37(width), r8=118(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 63
LDI r1, 215
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 116
LDI r6, 65
LDI r7, 37
LDI r8, 118
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
