; DESCRIPTION: Composite: Sets a single magenta pixel at (220, 212) then Draws a white rectangle at (92, 13) with width 79 and height 80.
; PLAN: r0=220(x), r1=212(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=92(x), r6=13(y), r7=79(width), r8=80(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 220
LDI r1, 212
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 92
LDI r6, 13
LDI r7, 79
LDI r8, 80
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
