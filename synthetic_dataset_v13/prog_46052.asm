; DESCRIPTION: Composite: Places a green circle of radius 44 at center (92, 160) then Places a red 42x25 rectangle at position (297, 175).
; PLAN: r0=92(x), r1=160(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=297(x), r6=175(y), r7=42(width), r8=25(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 160
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 297
LDI r6, 175
LDI r7, 42
LDI r8, 25
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
