; DESCRIPTION: Composite: Places a cyan dot at position (164, 221) then Draws a orange rectangle at (342, 32) with width 49 and height 22.
; PLAN: r0=164(x), r1=221(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=342(x), r6=32(y), r7=49(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 221
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 342
LDI r6, 32
LDI r7, 49
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
