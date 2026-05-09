; DESCRIPTION: Composite: Renders a cyan box of size 104x16 starting at (368, 68) then Sets a single magenta pixel at (499, 135).
; PLAN: r0=368(x), r1=68(y), r2=104(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=499(x), r6=135(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 368
LDI r1, 68
LDI r2, 104
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 499
LDI r6, 135
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
