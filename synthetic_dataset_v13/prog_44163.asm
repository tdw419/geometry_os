; DESCRIPTION: Composite: Draws a magenta circle centered at (412, 187) with radius 16 then Sets a single cyan pixel at (384, 210).
; PLAN: r0=412(x), r1=187(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=210(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 412
LDI r1, 187
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 210
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
