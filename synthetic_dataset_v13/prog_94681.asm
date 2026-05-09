; DESCRIPTION: Composite: Places a magenta 59x67 rectangle at position (209, 100) then Places a yellow dot at position (371, 156).
; PLAN: r0=209(x), r1=100(y), r2=59(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x), r6=156(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 209
LDI r1, 100
LDI r2, 59
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 156
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
