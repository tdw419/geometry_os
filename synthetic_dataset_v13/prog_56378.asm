; DESCRIPTION: Composite: Places a orange 10x86 rectangle at position (302, 36) then Places a magenta dot at position (242, 23).
; PLAN: r0=302(x), r1=36(y), r2=10(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x), r6=23(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 302
LDI r1, 36
LDI r2, 10
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 23
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
