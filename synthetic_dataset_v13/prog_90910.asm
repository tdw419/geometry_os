; DESCRIPTION: Composite: Places a orange dot at position (273, 104) then Places a yellow 103x34 rectangle at position (368, 156).
; PLAN: r0=273(x), r1=104(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=368(x), r6=156(y), r7=103(width), r8=34(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 104
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 368
LDI r6, 156
LDI r7, 103
LDI r8, 34
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
