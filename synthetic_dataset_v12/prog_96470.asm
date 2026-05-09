; DESCRIPTION: Composite: Renders a yellow box of size 103x27 starting at (242, 224) then Sets a single blue pixel at (372, 172).
; PLAN: r0=242(x), r1=224(y), r2=103(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x), r6=172(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 224
LDI r2, 103
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 172
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
