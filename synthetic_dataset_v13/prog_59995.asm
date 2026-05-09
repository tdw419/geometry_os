; DESCRIPTION: Composite: Places a green dot at position (383, 222) then Draws a cyan rectangle at (123, 39) with width 94 and height 10.
; PLAN: r0=383(x), r1=222(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=123(x), r6=39(y), r7=94(width), r8=10(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 222
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 123
LDI r6, 39
LDI r7, 94
LDI r8, 10
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
