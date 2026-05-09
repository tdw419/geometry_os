; DESCRIPTION: Composite: Places a cyan 61x120 rectangle at position (39, 111) then Renders a green disk with center (311, 101) and radius 59.
; PLAN: r0=39(x), r1=111(y), r2=61(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x), r6=101(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 39
LDI r1, 111
LDI r2, 61
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 101
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
