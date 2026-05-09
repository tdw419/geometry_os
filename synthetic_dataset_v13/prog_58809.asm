; DESCRIPTION: Composite: Creates a red circular shape at (77, 57) with radius 31 then Renders a cyan box of size 13x47 starting at (59, 153).
; PLAN: r0=77(x), r1=57(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x), r6=153(y), r7=13(width), r8=47(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 57
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 153
LDI r7, 13
LDI r8, 47
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
