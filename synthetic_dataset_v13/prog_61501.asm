; DESCRIPTION: Composite: Places a red dot at position (330, 183) then Places a blue 33x61 rectangle at position (464, 139) then Places a white circle of radius 37 at center (346, 50).
; PLAN: r0=330(x), r1=183(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=464(x), r6=139(y), r7=33(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x), r11=50(y), r12=37(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 330
LDI r1, 183
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 464
LDI r6, 139
LDI r7, 33
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 50
LDI r12, 37
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
