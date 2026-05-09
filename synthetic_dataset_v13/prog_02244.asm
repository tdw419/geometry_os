; DESCRIPTION: Composite: Renders a orange box of size 80x33 starting at (356, 32) then Places a white dot at position (14, 208).
; PLAN: r0=356(x), r1=32(y), r2=80(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x), r6=208(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 356
LDI r1, 32
LDI r2, 80
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 208
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
