; DESCRIPTION: Composite: Renders a magenta box of size 66x70 starting at (99, 128) then Sets a single orange pixel at (32, 4).
; PLAN: r0=99(x), r1=128(y), r2=66(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=32(x), r6=4(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 99
LDI r1, 128
LDI r2, 66
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 4
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
