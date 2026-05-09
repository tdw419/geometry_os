; DESCRIPTION: Composite: Renders a magenta box of size 92x10 starting at (302, 189) then Places a white dot at position (237, 42).
; PLAN: r0=302(x), r1=189(y), r2=92(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x), r6=42(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 302
LDI r1, 189
LDI r2, 92
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 42
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
