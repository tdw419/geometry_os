; DESCRIPTION: Composite: Places a green dot at position (243, 48) then Places a orange 100x54 rectangle at position (122, 81).
; PLAN: r0=243(x), r1=48(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=81(y), r7=100(width), r8=54(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 48
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 122
LDI r6, 81
LDI r7, 100
LDI r8, 54
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
