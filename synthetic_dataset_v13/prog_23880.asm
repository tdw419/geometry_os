; DESCRIPTION: Composite: Places a green 27x16 rectangle at position (167, 70) then Places a orange dot at position (313, 27).
; PLAN: r0=167(x), r1=70(y), r2=27(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x), r6=27(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 167
LDI r1, 70
LDI r2, 27
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 27
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
