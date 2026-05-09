; DESCRIPTION: Composite: Places a green dot at position (23, 190) then Draws a red circle centered at (224, 111) with radius 46.
; PLAN: r0=23(x), r1=190(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=224(x), r6=111(y), r7=46(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 23
LDI r1, 190
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 224
LDI r6, 111
LDI r7, 46
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
