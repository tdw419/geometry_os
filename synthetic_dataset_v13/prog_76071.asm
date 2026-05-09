; DESCRIPTION: Composite: Places a blue dot at position (432, 28) then Renders a magenta box of size 67x22 starting at (53, 195).
; PLAN: r0=432(x), r1=28(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=195(y), r7=67(width), r8=22(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 28
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 53
LDI r6, 195
LDI r7, 67
LDI r8, 22
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
