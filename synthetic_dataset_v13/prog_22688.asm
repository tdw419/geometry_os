; DESCRIPTION: Composite: Places a cyan circle of radius 37 at center (392, 197) then Renders a black box of size 59x88 starting at (165, 113).
; PLAN: r0=392(x), r1=197(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x), r6=113(y), r7=59(width), r8=88(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 197
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 113
LDI r7, 59
LDI r8, 88
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
