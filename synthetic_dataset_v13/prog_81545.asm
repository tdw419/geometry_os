; DESCRIPTION: Composite: Places a red 116x73 rectangle at position (114, 109) then Renders a cyan disk with center (361, 190) and radius 12.
; PLAN: r0=114(x), r1=109(y), r2=116(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x), r6=190(y), r7=12(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 109
LDI r2, 116
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 190
LDI r7, 12
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
