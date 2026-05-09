; DESCRIPTION: Composite: Renders a cyan box of size 44x33 starting at (229, 170) then Places a magenta circle of radius 52 at center (337, 61) then Places a green dot at position (228, 174).
; PLAN: r0=229(x), r1=170(y), r2=44(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x), r6=61(y), r7=52(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=228(x), r11=174(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 170
LDI r2, 44
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 61
LDI r7, 52
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 228
LDI r11, 174
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
