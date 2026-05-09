; DESCRIPTION: Composite: Renders a cyan box of size 43x32 starting at (65, 187) then Sets a single orange pixel at (382, 58).
; PLAN: r0=65(x), r1=187(y), r2=43(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=382(x), r6=58(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 65
LDI r1, 187
LDI r2, 43
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 58
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
