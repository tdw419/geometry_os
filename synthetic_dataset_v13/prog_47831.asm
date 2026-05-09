; DESCRIPTION: Composite: Draws a red circle centered at (369, 57) with radius 28 then Places a cyan 61x32 rectangle at position (369, 190).
; PLAN: r0=369(x), r1=57(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=369(x), r6=190(y), r7=61(width), r8=32(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 57
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 369
LDI r6, 190
LDI r7, 61
LDI r8, 32
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
