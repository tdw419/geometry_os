; DESCRIPTION: Composite: Sets a single magenta pixel at (231, 224) then Renders a yellow box of size 39x28 starting at (248, 217).
; PLAN: r0=231(x), r1=224(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=248(x), r6=217(y), r7=39(width), r8=28(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 224
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 248
LDI r6, 217
LDI r7, 39
LDI r8, 28
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
