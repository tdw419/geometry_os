; DESCRIPTION: Composite: Places a yellow dot at position (122, 230) then Places a blue 97x60 rectangle at position (368, 169).
; PLAN: r0=122(x), r1=230(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=368(x), r6=169(y), r7=97(width), r8=60(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 122
LDI r1, 230
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 368
LDI r6, 169
LDI r7, 97
LDI r8, 60
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
