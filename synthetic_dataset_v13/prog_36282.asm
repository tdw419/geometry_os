; DESCRIPTION: Composite: Places a cyan circle of radius 73 at center (226, 108) then Places a green 39x17 rectangle at position (313, 88).
; PLAN: r0=226(x), r1=108(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=313(x), r6=88(y), r7=39(width), r8=17(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 108
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 313
LDI r6, 88
LDI r7, 39
LDI r8, 17
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
