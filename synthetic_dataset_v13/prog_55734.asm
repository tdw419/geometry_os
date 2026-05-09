; DESCRIPTION: Composite: Creates a green rectangular region at (242, 28) spanning 91 by 10 pixels then Sets a single orange pixel at (291, 63).
; PLAN: r0=242(x), r1=28(y), r2=91(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=63(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 28
LDI r2, 91
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 63
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
