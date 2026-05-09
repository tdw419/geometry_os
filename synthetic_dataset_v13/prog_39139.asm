; DESCRIPTION: Composite: Sets a single orange pixel at (120, 1) then Places a yellow 30x59 rectangle at position (288, 58).
; PLAN: r0=120(x), r1=1(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=58(y), r7=30(width), r8=59(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 1
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 288
LDI r6, 58
LDI r7, 30
LDI r8, 59
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
