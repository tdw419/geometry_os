; DESCRIPTION: Composite: Places a green dot at position (252, 67) then Places a orange 86x10 rectangle at position (106, 208).
; PLAN: r0=252(x), r1=67(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=106(x), r6=208(y), r7=86(width), r8=10(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 67
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 106
LDI r6, 208
LDI r7, 86
LDI r8, 10
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
