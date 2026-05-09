; DESCRIPTION: Composite: Places a red dot at position (426, 28) then Renders a cyan box of size 16x100 starting at (190, 67).
; PLAN: r0=426(x), r1=28(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=190(x), r6=67(y), r7=16(width), r8=100(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 28
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 190
LDI r6, 67
LDI r7, 16
LDI r8, 100
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
