; DESCRIPTION: Composite: Places a green dot at position (383, 129) then Creates a red rectangular region at (36, 79) spanning 25 by 28 pixels.
; PLAN: r0=383(x), r1=129(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=79(y), r7=25(width), r8=28(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 129
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 36
LDI r6, 79
LDI r7, 25
LDI r8, 28
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
