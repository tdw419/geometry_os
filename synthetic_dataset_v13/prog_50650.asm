; DESCRIPTION: Composite: Renders a magenta box of size 13x21 starting at (397, 7) then Sets a single cyan pixel at (272, 243).
; PLAN: r0=397(x), r1=7(y), r2=13(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x), r6=243(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 397
LDI r1, 7
LDI r2, 13
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 243
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
