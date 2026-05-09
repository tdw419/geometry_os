; DESCRIPTION: Composite: Places a green dot at position (281, 249) then Places a magenta 46x53 rectangle at position (208, 40).
; PLAN: r0=281(x), r1=249(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=208(x), r6=40(y), r7=46(width), r8=53(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 249
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 208
LDI r6, 40
LDI r7, 46
LDI r8, 53
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
