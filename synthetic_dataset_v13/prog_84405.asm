; DESCRIPTION: Composite: Draws a cyan rectangle at (305, 30) with width 28 and height 73 then Places a yellow dot at position (336, 229).
; PLAN: r0=305(x), r1=30(y), r2=28(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x), r6=229(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 30
LDI r2, 28
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 229
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
