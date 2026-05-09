; DESCRIPTION: Composite: Places a black dot at position (28, 161) then Places a green 46x84 rectangle at position (231, 35).
; PLAN: r0=28(x), r1=161(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=231(x), r6=35(y), r7=46(width), r8=84(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 28
LDI r1, 161
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 231
LDI r6, 35
LDI r7, 46
LDI r8, 84
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
