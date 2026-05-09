; DESCRIPTION: Composite: Places a yellow dot at position (406, 202) then Draws a orange rectangle at (444, 68) with width 61 and height 64.
; PLAN: r0=406(x), r1=202(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=444(x), r6=68(y), r7=61(width), r8=64(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 202
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 444
LDI r6, 68
LDI r7, 61
LDI r8, 64
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
