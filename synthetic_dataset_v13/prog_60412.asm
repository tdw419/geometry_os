; DESCRIPTION: Composite: Places a magenta dot at position (287, 91) then Creates a cyan rectangular region at (3, 127) spanning 47 by 67 pixels.
; PLAN: r0=287(x), r1=91(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=3(x), r6=127(y), r7=47(width), r8=67(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 91
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 3
LDI r6, 127
LDI r7, 47
LDI r8, 67
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
