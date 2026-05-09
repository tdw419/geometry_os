; DESCRIPTION: Composite: Places a cyan 45x59 rectangle at position (356, 104) then Renders a red disk with center (294, 190) and radius 19.
; PLAN: r0=356(x), r1=104(y), r2=45(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x), r6=190(y), r7=19(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 356
LDI r1, 104
LDI r2, 45
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 190
LDI r7, 19
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
