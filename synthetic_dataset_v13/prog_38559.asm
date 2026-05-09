; DESCRIPTION: Composite: Places a cyan circle of radius 36 at center (304, 115) then Places a black 39x56 rectangle at position (42, 200).
; PLAN: r0=304(x), r1=115(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x), r6=200(y), r7=39(width), r8=56(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 115
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 200
LDI r7, 39
LDI r8, 56
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
