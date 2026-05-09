; DESCRIPTION: Composite: Places a black circle of radius 50 at center (135, 59) then Places a yellow 100x59 rectangle at position (350, 107).
; PLAN: r0=135(x), r1=59(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=107(y), r7=100(width), r8=59(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 59
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 107
LDI r7, 100
LDI r8, 59
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
