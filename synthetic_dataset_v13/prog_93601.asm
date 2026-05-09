; DESCRIPTION: Composite: Renders a magenta box of size 57x95 starting at (168, 125) then Sets a single magenta pixel at (176, 179).
; PLAN: r0=168(x), r1=125(y), r2=57(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x), r6=179(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 168
LDI r1, 125
LDI r2, 57
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 179
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
