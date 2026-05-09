; DESCRIPTION: Composite: Places a orange circle of radius 39 at center (238, 112) then Places a magenta 68x77 rectangle at position (398, 68).
; PLAN: r0=238(x), r1=112(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x), r6=68(y), r7=68(width), r8=77(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 112
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 68
LDI r7, 68
LDI r8, 77
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
