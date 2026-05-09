; DESCRIPTION: Composite: Sets a single green pixel at (179, 216) then Renders a magenta box of size 63x68 starting at (402, 113).
; PLAN: r0=179(x), r1=216(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=402(x), r6=113(y), r7=63(width), r8=68(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 216
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 402
LDI r6, 113
LDI r7, 63
LDI r8, 68
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
