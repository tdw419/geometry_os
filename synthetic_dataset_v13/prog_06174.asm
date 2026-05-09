; DESCRIPTION: Composite: Creates a red circular shape at (275, 207) with radius 36 then Places a magenta 33x22 rectangle at position (145, 39).
; PLAN: r0=275(x), r1=207(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=145(x), r6=39(y), r7=33(width), r8=22(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 207
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 145
LDI r6, 39
LDI r7, 33
LDI r8, 22
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
