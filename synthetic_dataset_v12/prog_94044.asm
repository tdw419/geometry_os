; DESCRIPTION: Composite: Places a green 12x21 rectangle at position (377, 174) then Sets a single magenta pixel at (315, 223).
; PLAN: r0=377(x), r1=174(y), r2=12(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x), r6=223(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 377
LDI r1, 174
LDI r2, 12
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 223
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
