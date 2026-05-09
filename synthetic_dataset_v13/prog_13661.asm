; DESCRIPTION: Composite: Places a black dot at position (177, 41) then Renders a yellow box of size 67x30 starting at (397, 198).
; PLAN: r0=177(x), r1=41(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=397(x), r6=198(y), r7=67(width), r8=30(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 177
LDI r1, 41
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 397
LDI r6, 198
LDI r7, 67
LDI r8, 30
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
