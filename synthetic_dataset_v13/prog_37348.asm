; DESCRIPTION: Composite: Sets a single yellow pixel at (307, 255) then Draws a blue rectangle at (365, 144) with width 67 and height 35.
; PLAN: r0=307(x), r1=255(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=144(y), r7=67(width), r8=35(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 255
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 365
LDI r6, 144
LDI r7, 67
LDI r8, 35
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
